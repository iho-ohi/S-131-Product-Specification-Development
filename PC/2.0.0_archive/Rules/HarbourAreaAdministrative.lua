-- Feature Catalogue Version: 2.0.0 (2025/10/25)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Harbour area (administrative) main entry point.

function HarbourAreaAdministrative(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface then
		viewingGroup = 36020
        featurePortrayal:AddInstructions(
            'ViewingGroup:36020;DrawingPriority:6;DisplayPlane:UnderRADAR'
        )
        featurePortrayal:AddInstructions('PointInstruction:131INFRM')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		
  elseif feature.PrimitiveType == PrimitiveType.Point then
		viewingGroup = 36020
		featurePortrayal:AddInstructions('ViewingGroup:36020;DrawingPriority:6;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:131SYMBL3L')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
