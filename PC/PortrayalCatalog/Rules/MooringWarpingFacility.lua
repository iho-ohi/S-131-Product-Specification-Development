-- Converter Version: 0.99
-- Feature Catalogue Version: 1.0.0 (2019/4/9)
-- Modified by RMM for S-131 1.0.0
-- TODO - determine whether symbolization should be split between 12410, 14010 and 32440

-- Mooring/Warping facility main entry point.
function MooringWarpingFacility(feature, featurePortrayal, contextParameters)
	local viewingGroup

	featurePortrayal:AddInstructions('AlertReference:NavHazard,115,115')

	if feature.PrimitiveType == PrimitiveType.Point and contextParameters.SimplifiedPoints then
		if feature.categoryOfMooringWarpingFacility == 1 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:MORFAC03')
		elseif feature.categoryOfMooringWarpingFacility == 2 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:MORFAC04')
		elseif feature.categoryOfMooringWarpingFacility == 3 then
			viewingGroup = 32440
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:PILPNT02')
		elseif feature.categoryOfMooringWarpingFacility == 4 then
			viewingGroup = 32440
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:MORFAC92')
		elseif feature.categoryOfMooringWarpingFacility == 5 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:PILPNT02')
		elseif feature.categoryOfMooringWarpingFacility == 6 then
			viewingGroup = 32440
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:MORFAC91')
		elseif feature.categoryOfMooringWarpingFacility == 7 then
			viewingGroup = 32440
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYMOR11')
		else
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:MORFAC03')
		end
	elseif feature.PrimitiveType == PrimitiveType.Point then
		if feature.categoryOfMooringWarpingFacility == 7 and feature.buoyShape == 3 then
			viewingGroup = 32440
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYMOR01')
		elseif feature.categoryOfMooringWarpingFacility == 7 and feature.buoyShape == 6 then
			viewingGroup = 32440
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYMOR03')
		elseif feature.categoryOfMooringWarpingFacility == 1 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:MORFAC03')
		elseif feature.categoryOfMooringWarpingFacility == 2 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:MORFAC04')
		elseif feature.categoryOfMooringWarpingFacility == 3 then
			viewingGroup = 32440
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:PILPNT02')
		elseif feature.categoryOfMooringWarpingFacility == 4 then
			viewingGroup = 32440
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:MORFAC92')
		elseif feature.categoryOfMooringWarpingFacility == 5 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:PILPNT02')
		elseif feature.categoryOfMooringWarpingFacility == 6 then
			viewingGroup = 32440
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:MORFAC91')
		elseif feature.categoryOfMooringWarpingFacility == 7 then
			viewingGroup = 32440
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:24;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:24;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:BOYMOR11')
		else
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:AddInstructions('PointInstruction:MORFAC03')
		end
	elseif feature.PrimitiveType == PrimitiveType.Curve then
		error('Invalid primitive type or mariner settings passed to portrayal S131 does not use Curve MORFAC')
    --[[
		if feature.categoryOfMooringWarpingFacility == 4 then
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:SimpleLineStyle('solid',0.64,'CSTLN')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		elseif feature.categoryOfMooringWarpingFacility == 6 then
			viewingGroup = 14010
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:14010;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:14010;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:SimpleLineStyle('dash',0.32,'CHMGF')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		else
			viewingGroup = 12410
			if contextParameters.RadarOverlay then
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:OverRADAR')
			else
				featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
			end
			featurePortrayal:SimpleLineStyle('solid',0.64,'CSTLN')
			featurePortrayal:AddInstructions('LineInstruction:_simple_')
		end
    ]]--
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		error('Invalid primitive type or mariner settings passed to portrayal S131 does not use Surface MORFAC')
		-- Plain and symbolized boundaries use the same symbolization
    --[[
		viewingGroup = 12410
		featurePortrayal:AddInstructions('ViewingGroup:12410;DrawingPriority:18;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('ColorFill:CHBRN')
		featurePortrayal:SimpleLineStyle('solid',0.32,'CHBLK')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
    ]]--
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
