-- Feature Catalogue Version: 1.0.0
-- Modified for S-131 2.0.0 by IIC 20250107

-- Waterway Area main entry point.
function WaterwayArea(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface then
		viewingGroup = 36020
		featurePortrayal:AddInstructions('ViewingGroup:36020;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:131INFRM')
  		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
  		featurePortrayal:AddInstructions('LineInstruction:_simple_')

	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
