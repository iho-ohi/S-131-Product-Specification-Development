-- Feature Catalogue Version: 2.0.0 (2025/10/25)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Vertical datum of data main entry point.
function VerticalDatumOfData(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 31040
		featurePortrayal:AddInstructions('ViewingGroup:31040;DrawingPriority:0;DisplayPlane:UnderRADAR;NullInstruction')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
