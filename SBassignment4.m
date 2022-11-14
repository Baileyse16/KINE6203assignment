% Assignment 4
% Sean Bailey
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile('isok_data_6803.csv')
 
%1 Create a function (name it genderIsoCalc.m) that returns four outputs. 
% The first set of outputs (one for males and one for females) 
% should return a matrix with individual mean isometric strength values
% across all 3 days of lifting for the appropriate group. 
% The second set of outputs will return the single mean value for each group 
% (mean of subject means). 
% Call this function in your main script and store the 
% results with variable names 
% maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean and femaleGroupIsoMean. 
% These data should not be normalized.

[maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3);

% function [maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean,femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)
% %UNTITLED2 Summary of this function goes here
% %   Detailed explanation goes here
% 
% 
% 
% % i is a counter and will make the function sort through each individual
% % subjectid starting with 1
% 
% for i = 1:length(Gender)
%     if Gender(i) == 'F'
%         femaleIsoIndMeans(i) = (Day1(i) + Day2(i) + Day3(i)) / 3;
%     else
%         maleIsoIndMeans(i) = (Day1(i) + Day2(i) + Day3(i)) / 3;
%     end
% end
% 
% femaleIsoIndMeans = femaleIsoIndMeans
% maleIsoIndMeans = maleIsoIndMeans
% 
% 
% maleGroupIsoMean = mean(nonzeros(maleIsoIndMeans));
% 
% % takes the mean of all males and takes out the zeros that are listed for
% % the females
% 
% femaleGroupIsoMean = mean(nonzeros(femaleIsoIndMeans));
% 
% %take the mean of all females and takes out the zeros that are listed for
% %the males 
% 
% end

%2 Create a function (name it dayComparer.m) that takes the
% subject ids and two days as inputs and returns a matrix with the subject IDs
% of the subjects who had an increase from the first day to the second day
% (it should also work for the second day to the third day). 
% Run this function in your main script twice 
% (be sure to update your inputs when you call the function the second time) 
% and store the outputs as day1toDay2 and day2toDay3.


[day1toDay2] = dayComparer(SubjectID,Day1,Day2);
[day2toDay3] = dayComparer(SubjectID,Day2,Day3);


% function [DayAtoDayB] = dayComparer(SubjectID,DayA,DayB)
% %UNTITLED Summary of this function goes here
% %   Detailed explanation goes here
% 
% % i is a counter and will make the function sort through each individual
% % subjectid starting with 1
% 
% 
% for i = 1:length(SubjectID)
%     if DayB(i) > DayA(i) 
%         DayAtoDayB(i) = SubjectID(i);
%     end
%        
% 
% 
% 
% % DayA and DayB aswell as the output DayAtoDayB are interchangeable in 
% % the function script and are assigned to the correct names in the
% % assignment script
% 
% end
% 
% 
% 
% 
% 
% 
% end



%3 Weight normalize the isokinetic data and calculate the group means
% for each day. Store these values with the names normDay1mean, normDay2mean, 
% normDay3mean. You do not need to write a function for this, 
% but if you’d like to feel free.

[normDay1mean] = normalizer(SubjectID,Weight,Day1);
[normDay2mean] = normalizer(SubjectID,Weight,Day2);
[normDay3mean] = normalizer(SubjectID,Weight,Day3);


% function [normDayAmean] = normalizer(SubjectID,Weight,DayA)
% %UNTITLED2 Summary of this function goes here
% %   Detailed explanation goes here
% 
% 
% % below looks at each value in the SubjectID and divides their Day(1,2,or3)
% % by their body weight to find their pound for pound strength 
% 
% for i = 1:length(SubjectID)
% NormalizedDataDayA(i) = DayA(i)/Weight(i)
% end
% 
% % below is no longer needed but gives me the mean for a given day now i have to normalize the data
% % then run the below function
% % for i = length(SubjectID)
% %      normDayAsum = sum(DayA)
% %      normDayAmean = normDayAsum / length(SubjectID)
% %  end
% 
% 
% % below looks at each value in the SubjectID and then adds all the
% % normalized data (pound for pound strength) and finds the mean of the
% % group for each day
% 
% 
% for i = 1:length(SubjectID)
%     normDayAsum = sum(NormalizedDataDayA)
%     normDayAmean = normDayAsum / length(SubjectID)
% end
% 
% 
% end




%4 Export your results to a csvfile using an appropriate
% built-in function. Name the file iso_results.csv. 
% (You do not need to submit this file because your script 
% should create this file when I run your code.)

m = [maleIsoIndMeans femaleIsoIndMeans maleGroupIsoMean femaleGroupIsoMean day1toDay2 day2toDay3 normDay1mean normDay2mean normDay3mean];
writematrix(m','iso_results.csv')

