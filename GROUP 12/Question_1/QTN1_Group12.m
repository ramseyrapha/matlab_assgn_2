clear, clc;   %clear_Cleans the workspace, clc_cleans the command window only

%Importing data from the spreadsheet into matlab
inputFileName = 'C:\Users\DIL\Desktop\MATLAB PROB\GROUP 12\Question_1\STUDENT_DATA';
studentData = readtable(inputFileName);

%Extracting data from table
FirstName = studentData.FirstName;
LastName = studentData.LastName;
Reg_No = studentData.REG_NO;
Age = studentData.AGE;
Gender = studentData.SEX;
Status = studentData.STATUS;
Tribe = studentData.TRIBE;
Association = studentData.ASSOCIATION;
Residence = studentData.HALL;
Friend = studentData.FRIEND;

disp(studentData); %Displays table preview in the command window

%exporting table into a new excel sheet: Group12.xlsx 
outputTable = 'Group12.xlsx';
writetable(studentData, outputTable);
fprintf('Data successfully exported to: %s\n\n', outputTable);

%outputting some plots from the tabular data
plot1 = figure('Name','Association');
histogram(categorical(Association));
title('Student Distribution by Associations');
xlabel('Associations');
ylabel('Number of Students');
grid on;

saveas(plot1, 'Assocation_Distribution.png');
disp('Distribution of students in associations saved successfully as Assocation_Distribution.png');

plot2 = figure('Name','Residency');
histogram(categorical(Residence));
title('Student Distribution by Residence');
xlabel('Residences');
ylabel('Number of Students');
grid off;

saveas(plot1, 'Residence_Distribution.png');
disp('Distribution of students in residences saved successfully as Residence_Distribution.png');



