-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)
-- Adapted for S-131 by RMM

-- Harbour facility main entry point.
function HarbourFacility(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SimplifiedPoints then
		if contains(1, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:ROLROL01')
		elseif contains(4, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:HRBFAC09')
		elseif contains(5, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:SMCFAC02')
		elseif contains(12, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:SHPLFT92')
		elseif contains(13, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:STRADC92')
		else
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:CHINFO07')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if contains(1, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:ROLROL01')
		elseif contains(4, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:HRBFAC09')
		elseif contains(5, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:SMCFAC02')
		elseif contains(12, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:SHPLFT92')
		elseif contains(13, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:STRADC92')
		else
			viewingGroup = 32410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:CHINFO07')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		if contains(1, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:ROLROL01')
		elseif contains(4, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:HRBFAC09')
		elseif contains(5, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:SMCFAC02')
		elseif contains(12, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:SHPLFT91')
		elseif contains(13, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:STRADC91')
		else
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:CHINFO07')
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		if contains(1, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:ROLROL01')
		elseif contains(4, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:HRBFAC09')
		elseif contains(5, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:SMCFAC02')
		elseif contains(12, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:SHPLFT91')
		elseif contains(13, feature.categoryOfHarbourFacility) then
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:STRADC91')
		else
			viewingGroup = 32410
			featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR')
			featurePortrayal:AddInstructions('PointInstruction:CHINFO07')
		end
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
