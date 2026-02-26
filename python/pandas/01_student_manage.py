import pandas as pd

##############3 Add Student function ################################

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
        stu_id =  len(students) + 1
        no_subs = int(input(f"Enter the number of subjects for {name}:- "))
        while no_subs <= 0 :
            print("Enter atleast one subject")
            no_subs = int(input(f"Enter the number of subjects for {name}:- "))
        student = {
            "Id" : stu_id,
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
        student["marks_max"] = max(tot_marks)
        student["marks_min"] = min(tot_marks)

        students.append(student)

##############3 show Student function ################################


def show_students(students):
    if len(students) == 0:
        print("No student found")
        return
    df = pd.DataFrame(students)
    print("\n These are the students:- ")
    print(df)

##############3 edit Student function ################################


def edit_students(students):
    if len(students) == 0:
        print("No Student found, please add the student")
        return
    df = pd.DataFrame(students)
    all_cols = list(df.columns)
    print("------- all_cols ---------")
    print(f"all_cols are {all_cols}")
    print("------- all_ids ---------")
    all_ids = list(df["Id"])
    print(f"all_ids are {all_ids}")
    print("-------------------------")
    print("------- edit_id ---------")
    edit_id = int(input(f"Enter the edit_id from {all_ids}:- "))
    while edit_id not in all_ids:
        print("edit id is not in all_ids enter again")
        edit_id = int(input(f"Enter the edit_id from all_ids:- "))
    row_index = df.index[df["Id"]== edit_id][0]
    print("------- getting index number for Id in DF ---------")
    print(f"The Row Index is: {row_index}")
    print("------- data at the edit_id ---------")
    print(df.loc[[row_index]].to_string(index=False))
    for col in all_cols:
        if col not in [ "Id", "marks_sum", "marks_ave", "marks_max", "marks_min" ]:
            cur_val = df.loc[row_index, col]
            new_val = input(f"cur_val for {col}: {cur_val}, put new or enter to keep same:- ")
            if new_val.strip() != "":
                if col == "no_of_subs":
                    new_val = int(new_val)
                elif col == "name":
                    new_val = new_val
                else:
                    new_val = float(new_val)
                df.loc[row_index, col] = new_val
    sub_marks = []
    for col in all_cols:
        if col not in [ "Id", "no_of_subs", "name", "marks_sum", "marks_ave", "marks_max", "marks_min" ]:
            val = float(df.loc[row_index,col])
            if pd.notna(val):
                sub_marks.append(val)
    df.loc[row_index,"marks_sum"] = sum(sub_marks)
    df.loc[row_index,"marks_ave"] = sum(sub_marks)/len(sub_marks)
    df.loc[row_index,"marks_max"] = max(sub_marks)
    df.loc[row_index,"marks_min"] = min(sub_marks)

    print("\nUpdated Details:")
    print(df.loc[[row_index]].to_string(index=False))
    print("------- total data: ---------")
    print(df.to_string(index=False))
    students.clear()
    students.extend(df.to_dict(orient="records"))

##############3 main function ################################


def main():
    students1 = []
    while True:
        print("\nStudent Management System")
        print("Enter 1 to add sutents")
        print("Enter 2 to show sutents")
        print("Enter 3 to edit sutents")
        print("Enter 4 to exit")
        # print("Enter 1 to add sutent")

        choice = int(input("Enter your choice:- "))
        if choice == 1:
            add_student(students1)
        elif choice == 2:
            show_students(students1)
        elif choice == 3:
            edit_students(students1)
        elif choice == 4:
            print("Exiting!!!")
            break
        
        else:
            print("invalid choice")



if __name__ == "__main__":
    main()
