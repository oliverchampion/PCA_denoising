function [denoised_data, b_values] = PCAMIP(data,b_values,options)
%%
% This program generates a maximum intensity projection after a PCA
% denoising of the data, as suggested by Pai et al.  https://doi.org/10.1002/mrm.22748. 
% My script uses the PCA as implemented by: 
% "Principal component analysis for fast and model-free denoising of multi b-value diffusion-weighted MR images"
% by Gurney-Champion et al. PMB 2019 DOI: https://doi.org/10.1088/1361-6560/ab1786
%
% Contact: o.j.gurney-champion@amsterdamumc.nl
%
%%
if nargin==2
    denoised_data1=PCA_denoise_DWI(data,b_values);
else
    denoised_data1=PCA_denoise_DWI(data,b_values,options);
end
ub=unique(b_values);

for ub_sel=1:length(ub)
    if length(size(denoised_data1))==4
        denoised_data(:,:,:,ub_sel)=max(denoised_data1(:,:,:,b_values==ub(ub_sel)),[],4);
    else
        denoised_data(:,:,ub_sel)=max(denoised_data1(:,:,b_values==ub(ub_sel)),[],4);
    end
end
b_values=ub;
end