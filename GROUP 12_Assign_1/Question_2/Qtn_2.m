  clc; clear;
  
  numSemesters = input('Enter numer of semesters completed: ');
  
  totalCumPoints = 0;
  totalCumCredits = 0;
  
%Defining the variables and parameters for calulating gpa and cgpa
 for s = 1:numSemesters
      fprintf('\n--- Semester %d ---\n', s);
      numCourses = input('Enter the number of course units for this semester: ');
      
      courseName = cell(numCourses, 1);
      creditUnits = zeros(numCourses, 1);
      gradePoints = zeros(numCourses, 1);
      
      for i = 1:numCourses
          courseName{i} = input(sprintf('Course %d Name: ', i), "s");
          
          cu = input('Credit Units(CU): ');
          while isempty(cu) || cu <= 0
              cu = input('Re-enter valid CUs: ');
          end
         creditUnits(i) = cu;

        %Marks input
         marks = input('Enter Marks achieved /100%: ');
         while isempty(marks) || marks < 0 || marks > 100
             marks = input('Re-enter valid Marks achieved (0 - 100): ');
         end
         
         % AUTOMATIC GRADING: Map marks to Busitema University GP system
         if marks >= 80
             gp = 5.0;
         elseif marks >= 75
             gp = 4.5;
         elseif marks >= 70
             gp = 4.0;
         elseif marks >= 65
             gp = 3.5;
         elseif marks >= 60
             gp = 3.0;
         elseif marks >= 55
             gp = 2.5;
         elseif marks >= 50
             gp = 2.0;
         else
             gp = 0.0; % Retake / Fail threshold
         end         
         gradePoints(i) = gp;
      end


     %Calculations for GPA
      qualityPoints = gradePoints .* creditUnits;
      semPoints = sum(qualityPoints);
      semCredits = sum(creditUnits);

      semGPA = semPoints / semCredits;

      %Display the semester results in a table
      semTable = table(courseName, creditUnits, gradePoints, ...
          'VariableNames', {'Course', 'Credit_Units', 'Grade_Points'});
      disp(semTable);
      fprintf('Semester %d Credits: %d | Points: %.2f | Semester GPA: %.4f\n', ...
          s, semCredits, semPoints, semGPA);
 end
     
%Calculating for CGPA
totalCumPoints = totalCumPoints + semPoints;
totalCumCredits = totalCumCredits + semCredits;

CGPA = totalCumPoints / totalCumCredits;
fprintf('Total Cummulative Credits:     %d\n', totalCumCredits);
fprintf('Total Cummulative Points:      %.2f\n', totalCumPoints);
fprintf('Final CGPA:                    %.4f\n', CGPA);






