-- Feature Catalogue Version: 2.0.0 (2025/10/25)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Dock area main entry point.
function DockArea(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface then
			viewingGroup = 36020

			featurePortrayal:AddInstructions('ViewingGroup:36020;DrawingPriority:6;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('ColorFill:DEPVS')

			if feature.featureName[1] and feature.featureName[1].name then
				featurePortrayal:AddInstructions('LocalOffset:0,0;TextAlignHorizontal:Center;TextAlignVertical:Center;FontSize:10')
				featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters)), 26, 24, 36020, 6)
			end

			featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
