#src/utils.py

import numpy as np 
import os 
import glob 
import matplotlib.pylab as plt 
#loading requried packages 

import sys 
import logging 
import six
#for image
import pydicom as dicom 
import pydicom as dicom 
import scipy
from scipy.spatial import ConvexHull

class dicom_sample:
    def __init__(self, path):
        self.path = path 
        self.ROI, self.scans, self.segmentation,self.sample_id, self.N, self.spacing = self.extract_dicom(self.path)
        self.firstorderfeature =[] 
        self.shapefeature = []
        self.getfeature()

    def getfeature(self):
        if (self.ROI is not None):
            self.firstorderfeature = np.array(self.get_firstorderfeature())
            self.shapefeature =  np.array(self.get_shapefeature3D())

    def load_scan(self,path):
        slices = [dicom.read_file(s) for s in glob.glob(path+"/*")]
        slices.sort(key = lambda x: int(x.InstanceNumber))
        try:
            slice_thickness = np.abs(slices[0].ImagePositionPatient[2] - slices[1].ImagePositionPatient[2])
        except:
            slice_thickness = np.abs(slices[0].SliceLocation - slices[1].SliceLocation)
        
        return slices,slice_thickness

    def _moment(self,a, moment=1): 
        """
        Calculate n-order moment of an array for a given axis
        """
        if moment == 1:
            return np.float(0.0)
        else:
            mn = np.nanmean(a, 1, keepdims=True)
            s = np.power((a - mn), moment)
            return np.nanmean(s, 1)

    def get_firstorderfeature(self):
        ROI = self.ROI
        features = [] 
        Np = len(ROI) 
        V_voxel = self.spacing[0]*self.spacing[1] * self.spacing[2]
        #1
        energy = np.sum(np.square(ROI))
        features.append(energy)
        #2
        features.append(energy * V_voxel)
        _, p_i = np.unique(ROI, return_counts=True)
        p_i = p_i.reshape((1,-1))
        #3
        features.append(-1.0*np.sum(p_i * np.log2(p_i+np.spacing(1)),1)[0])
        #4 minimum
        features.append(np.nanmin(ROI,1)[0])
        #5 10th percentile of ROI 
        prcnt10 = np.nanpercentile(ROI,10,axis=1)
        features.append(prcnt10[0])
        #6 90th percentile 
        prcnt90 = np.nanpercentile(ROI,90, axis=1)
        features.append(prcnt90[0])
        #7 max
        features.append(np.nanmax(ROI,1)[0])
        #8 mean 
        features.append(np.nanmean(ROI,1)[0])
        #9 median 
        features.append(np.nanmedian(ROI,1)[0])
        #10 Interquartile range 
        features.append(np.nanpercentile(ROI,75,1)[0] - np.nanpercentile(ROI,25,1)[0])
        #11 Range of gray values
        features.append(np.nanmax(ROI,1)[0] - np.nanmin(ROI,1)[0])
        #12  mean absolute deviation
        u_x =np.nanmean(ROI,1,keepdims=True)
        features.append(np.nanmean(np.absolute(ROI - u_x),1)[0])
        #13 robust mean absolute deviation 
        percentileArray = ROI.copy() 
        msk = ~np.isnan(percentileArray) 
        msk[msk] = ((percentileArray - prcnt10[:, None])[msk] < 0) | ((percentileArray - prcnt90[:, None])[msk] > 0)
        # Finally, exclude the invalid voxels by setting them to nan.
        percentileArray[msk] = np.nan
        features.append(np.nanmean(np.absolute(percentileArray - np.nanmean(percentileArray, 1, keepdims=True)), 1)[0])
        #14RMS
        Nvox = np.sum(~np.isnan(ROI), 1).astype('float')
        features.append(np.sqrt(np.nansum(ROI ** 2 , 1)/Nvox)[0])
        #15 
        features.append(np.nanstd(ROI, axis=1)[0])
        #16 skewness 
        m2 = self._moment(ROI,2)
        m3 = self._moment(ROI, 3)
        features.append(m3[0]/m2[0] ** 1.5)
        #17
        m4 = self._moment(ROI,4) 
        m2[m2==0] = 1
        m4[m2 ==0] = 0 
        features.append(m4[0] / m2[0] ** 2.0 )
        #18 
        features.append(np.nanstd(ROI,1)[0] ** 2)
        #19 
        features.append( np.nansum(p_i ** 2, 1)[0])
        return features 

    def get_shapefeature3D(self):
        pixel_spacing = self.spacing
        tumor_points = np.array(np.where(self.segmentation != 0 )).transpose()
        scaled_points = np.dot(tumor_points, np.diag(pixel_spacing))
        tumor = ConvexHull(scaled_points)
        tumorSurfaceArea, tumorVolume = tumor.area,tumor.volume
        #feret diameter
        tumorRadius = np.sqrt(np.sum((tumor.max_bound - tumor.min_bound) **  2))
        Np = scaled_points.shape[0]
        physicalCoordinates = scaled_points - np.mean(scaled_points, axis=0)
        physicalCoordinates = physicalCoordinates / np.sqrt(Np)
        covariance = np.dot(physicalCoordinates.T.copy(), physicalCoordinates)
        eigenValues = np.linalg.eigvals(covariance)
        eigenValues.sort()
        features=[]
        features.append(tumorVolume)
        features.append( Np*pixel_spacing[0]*pixel_spacing[1]*pixel_spacing[2])
        features.append(tumorSurfaceArea)
        features.append(tumorSurfaceArea/tumorVolume)
        features.append((36.0 * np.pi *tumorVolume **2) ** (1.0/3.0) / tumorSurfaceArea)
        features.append(tumorVolume / (tumorSurfaceArea ** (3.0 / 2.0) * np.sqrt(np.pi)))
        features.append( (36.0 * np.pi) * (tumorVolume ** 2.0) / (tumorSurfaceArea ** 3.0))
        features.append(tumorSurfaceArea / (36.0 * np.pi * tumorVolume ** 2) ** (1.0/3.0))
        features.append(tumorRadius * 2)
        #missing: 2d diameters on 3 axies
        if eigenValues[2] <0 : 
            features.append(np.nan)
        else:
            features.append(np.sqrt(eigenValues[2]) *4) 
        if eigenValues[0] <0 : 
            features.append(np.nan)
        else:
            features.append(np.sqrt(eigenValues[0]) *4) 
        if eigenValues[1] <0 or eigenValues[2] < 0  : 
            features.append(np.nan)
        else:
            features.append(np.sqrt(eigenValues[1] / eigenValues[2]))
        if eigenValues[0] < 0 or eigenValues[2] < 0: 
            features.append(np.nan)
        else: 
            features.append(np.sqrt(eigenValues[0] / eigenValues[2]))
        return features 

    
    def get_pixels_hu(self,scans):
        image = np.stack([s.pixel_array for s in scans])[::-1]
        # Convert to int16 (from sometimes int16), 
        # should be possible as values should always be low enough (<32k)
        image = image.astype(np.int16)

        # Set outside-of-scan pixels to 1
        # The intercept is usually -1024, so air is approximately 0
        image[image == -2000] = 0
    
        # Convert to Hounsfield units (HU)
        intercept = scans[0].RescaleIntercept
        slope = scans[0].RescaleSlope
    
        if slope != 1:
            image = slope * image.astype(np.float64)
            image = image.astype(np.int16)
        
        image += np.int16(intercept)
        return np.array(image, dtype=np.int16)

    def extract_dicom(self, path):
        N=0 
        ROI,sample_id,spacing = None,None,None
        scans,segmentation = None, None
        tumor_scans, tumor_segmentation = None ,None
        for film_path in glob.glob(path+"/*"):
            if "segmentation" not in film_path and len(glob.glob(film_path+"/*.dcm")) > 1: 
                N = len(glob.glob(film_path + "/*.dcm"))
                patients, slice_thickness = self.load_scan(film_path)
                scans = self.get_pixels_hu(patients)
                spacing  = np.array([float(slice_thickness),float(patients[0].PixelSpacing[0]), float(patients[0].PixelSpacing[1])], dtype='float32')
                #scans_resample ,spacing= self.resample(scans,patients, [1,1,1])
            else:
                cur_file = glob.glob(film_path+"/*.dcm")[0]
                segmentation = dicom.read_file(cur_file).pixel_array
                sample_id = dicom.read_file(cur_file).PatientID
        if (segmentation is not None and scans is not None and (segmentation.shape[0] == scans.shape[0])):
            ROI = scans[segmentation==1].astype('float').reshape((1,-1))       
            tumor_slices = np.unique(np.where(segmentation==1)[0])
            tumor_scans = scans[tumor_slices,:,:]
            tumor_segmentation = segmentation[tumor_slices, :,:]
        return ROI, tumor_scans, tumor_segmentation ,sample_id, N, spacing

    def resample(self,image, scan, new_spacing=[1,1,1]):
        # Determine current pixel spacing
        spacing = np.array([float(scan[0].SliceThickness),float(scan[0].PixelSpacing[0]), float(scan[0].PixelSpacing[1])], dtype='float32') 

        resize_factor = spacing / new_spacing
        new_real_shape = image.shape * resize_factor
        new_shape = np.round(new_real_shape)
        real_resize_factor = new_shape / image.shape
        new_spacing = spacing / real_resize_factor
    
        image = scipy.ndimage.interpolation.zoom(image, real_resize_factor)
    
        return image, new_spacing
    def display(self):
       
        if self.segmentation is not None:
            plt.imshow(self.scans[0],cmap='gray')
            plt.imshow(self.segmentation[0], cmap = 'Reds', alpha=0.5)
            #tumor_slices = self.segmentation.shape[0]
            #rows=6
           # cols = int(tumor_slices/rows)+1
            #fig,ax = plt.subplots(rows, cols,figsize=[12,12])
            #k=0
            #for i in range(tumor_slices):
            #    ind = i
            #    row_i = int(k/cols) 
            #    row_j = int(k % cols) 
           #     ax[row_i,row_j].set_title('slice %d' % ind)            
           #     ax[row_i,row_j].imshow(self.scans[ind],cmap='gray')
           #     ax[row_i,row_j].imshow(self.segmentation[ind], cmap = 'Reds', alpha=0.5)
          #      ax[row_i, row_j].axis('off')
          #      k  = k+1
           # while row_j < cols:
           #     ax[rows-1, row_j].set_visible(False)
           #     row_j += 1
            
            plt.show()
        else: 
            print ("Sample has no tumor")
