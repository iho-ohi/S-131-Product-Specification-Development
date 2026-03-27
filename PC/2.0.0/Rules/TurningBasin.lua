-- Feature Catalogue Version: 1.0.0 (2022/12/31)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Turning Basin area main entry point.
function TurningBasin(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 36020
    if contextParameters.RadarOverlay then
    	featurePortrayal:AddInstructions('ViewingGroup:36020;DrawingPriority:12;DisplayPlane:OverRADAR')
    else
    	featurePortrayal:AddInstructions('ViewingGroup:36020;DrawingPriority:12;DisplayPlane:UnderRADAR')
    end
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		featurePortrayal:AddInstructions('PointInstruction:131INFRM')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
