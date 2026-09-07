% QTN1_Group12.m - Student Demographics & Social Data Visualization

clear; clc;

% Reading data from the Excel sheet(Importing) 
studentData = readtable('STUDENT_DATA.xlsx');

% Extracting data from the table and assigning variables
SN          = studentData.S_N;
FName        = studentData.FirstName;
Age         = studentData.AGE;
Sex         = categorical(studentData.SEX);
Status      = categorical(studentData.STATUS);
Association = categorical(studentData.ASSOCIATION);
Hall        = categorical(studentData.HALL);
Friend      = categorical(studentData.FRIEND);

% Compute counts for categorical variables
[assocCounts, assocCats] = groupcounts(Association);
[hallCounts, hallCats]   = groupcounts(Hall);
[statusCounts, statusCats]  = groupcounts(Status);

%Plotting some demographic graphs
% --- Plot 1:Bar Chart ('bar') ---
f1 = figure('Name', 'Association_Distribution');
bar(assocCats, assocCounts);
title('Student Distribution by Association');
xlabel('Student Association'); ylabel('Number of Students');
grid on;
saveas(f1, 'Association_Bar.png');

% --- Plot 2: Horizontal Bar Chart ('barh') ---
% Sorting Halls by count
[sortedHallCounts, sortIdx] = sort(hallCounts, 'ascend');
sortedHallCats = hallCats(sortIdx);

f2 = figure('Name', 'Residence_Distribution');
barh(sortedHallCats, sortedHallCounts);
title('Student Distribution by Residence Hall');
xlabel('Number of Students');
ylabel('Residence Hall');
grid on;
saveas(f2, 'Residence_BarH.png');

% --- Plot 3: Pie Chart ('pie') ---
f3 = figure('Name', 'Marital_Status_Pie');
% Explode the 'MARRIED' slice if it exists, otherwise just plot
explode = (categories(Status) == "MARRIED");
pie(statusCounts, explode, categories(Status));
title('Proportion of Students by Marital Status');
saveas(f3, 'Status_Pie.png');

% --- Plot 4: Pareto Chart ('pareto') ---
f4 = figure('Name', 'Association_Pareto');
pareto(assocCounts, assocCats);
title('Pareto Analysis of Student Associations');
ylabel('Count / Cumulative Percentage');
grid on;
saveas(f4, 'Association_Pareto.png');

% --- Plot 5: Age Distribution Histogram ('histogram') ---
f5 = figure('Name', 'Age_Histogram');
histogram(Age);
title('Student Age Distribution');
xlabel('Age (Years)'); ylabel('Frequency');
grid on;
saveas(f5, 'Age_Histogram.png');

% --- Plot 6: Line Plot ('plot')---
f6 = figure('Name', 'Line Plot');
plot(Age);
title('Line Plot');
xlabel('Student');
ylabel('Age');
grid on;
saveas(f6, 'Line_Plot.png');

% --- Plot 7: Error Bar Plot ('errorbar')---
f7 = figure('Name', 'Error Bar Plot');
meanAges = [mean(Age(Sex == 'M')), mean(Age(Sex == 'F'))];
stdAges  = [std(Age(Sex == 'M')),  std(Age(Sex == 'F'))];
errorbar([1, 2], meanAges, stdAges);
set(gca, 'XTick', [1, 2], 'XTickLabel', {'Male', 'Female'});
title('Error Bar Plot');
xlabel('Gender');
ylabel('Age');
grid on;
saveas(f7, 'Error_Plot.png');

% --- Plot 8: Box Plot ('boxplot')---
f8 = figure('Name', 'Box Plot');
boxplot(Age);
title('Box Plot');
grid on;
saveas(f8, 'Box_Plot.png');

% --- Plot 9: Logarithmic Plot ('semilogy')---
f9 = figure('Name', 'Logarithmic Plot');
semilogy(SN, Age);
title('Semilogy Plot');
xlabel('Student Index (S_N)');
ylabel('Age (Log Scale)');
grid on;
saveas(f9, 'Logarithmic_Plot.png');

% --- Plot 10: Pie Chart with Percent Labels ('pie')---
f10 = figure('Name', 'Pie Chart with Percent Labels');
pie(Status);
title('Pie Chart with Percent Labels');
saveas(f10, 'Pie_Chart_with_Percent_Labels.png')

disp('Question 1 demographic plots generated and saved successfully.');