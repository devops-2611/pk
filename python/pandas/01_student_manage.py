import pandas as pd

def add_student(students):
    no_students = int(input("Enter the number of students:- "))
    while no_students <= 0:
    # if no_students <= 0:
        print(f"You entered less than one student please enter correct number again:- ")
        no_students = int(input("Enter the number of students:- "))
    for i in range(no_students):
        name = input(f"Enter the name of student- {i+1}:- ")
        while name == "":
            print("Name of student should not be empty")
            name = input(f"Enter the name of student- {i+1}:- ")
        stu_id = (i+1)
        no_subs = int(input(f"Enter the number of subjects for {name}:- "))
        while no_subs <= 0 :
            print("Enter atleast one subject")
            no_subs = int(input(f"Enter the number of subjects for {name}:- "))
        student = {
            "id" : stu_id,
            "name" : name,
            "no_of_subs" : no_subs
        }
        tot_marks = []
        for j in range(no_subs):
            sub_name = input(f"Enter the name of subject {j+1}:- ")
            while sub_name == "":
                print("Name of subject should not be empty")
                sub_name = input(f"Enter the name of subject {j+1}:- ")
            sub_mark = float(input(f"Enter the marks for {sub_name}:- "))
            tot_marks.append(sub_mark)
            student[sub_name] = sub_mark

        student["marks_sum"] = sum(tot_marks)
        student["marks_ave"] = sum(tot_marks)/no_subs
        student["mars_max"] = max(tot_marks)
        student["marks_min"] = min(tot_marks)

        students.append(student)

def show_students(students):
    if len(students) == 0:
        print("No student found")
        return
    df = pd.DataFrame(students)
    print("\n These are the students:- ")
    print(df)

def edit_students(students):
    if len(students) == 0:
        print("No Student found, please add the student")
        return
    df = pd.DataFrame(students)
    cols = df.columns



def main():
    students1 = []
    while True:
        print("\nStudent Management System")
        print("Enter 1 to add sutents")
        print("Enter 2 to show sutents")
        print("Enter 3 to exit")
        # print("Enter 1 to add sutent")

        choice = int(input("Enter your choice:- "))
        if choice == 1:
            add_student(students1)

        elif choice == 2:
            show_students(students1)

        elif choice == 3:
            print("Exiting!!!")
            break
        
        else:
            print("invalid choice")



if __name__ == "__main__":
    main()



        
            







