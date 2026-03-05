def add_students(df):
    print(f"Lenth of df is: {len(df)}")
    print("--------- Adding Students ---------")
    name = input("Enter the name of student:- ")
    while name.strip() == "":
        print("name should not be blank")
        name = input("Enter the name of student:- ")
    # stu_id = len(df)+1
    if df.empty:
        stu_id = 1
    else:
        stu_id = df["stu_id"].max()+1
    stu_data = {
        "name" : name,
        "stu_id" : stu_id
    }
    while True:
        try:
            no_subs = int(input(f"Enter the no_subs for {stu_id}:{name}:- "))
            if no_subs < 1:
                print("enter atlease 1 sub")
                continue
            break

        except ValueError:
            print("ValueError")


    all_marks = []
    for i in range(no_subs):
        sub_name = input(f"Enter the {i+1}.sub_name: ")
        while sub_name.strip() == "":
            sub_name = input(f"Enter the {i+1}.sub_name: ")
        while True: 
            try:
                sub_marks = float(input(f"Ether the marks for {sub_name}:- "))
                if sub_marks < 0:
                    print("sub_marks can not be -ve")
                    continue
                break
            except ValueError:
                print("ValueError")
        if sub_name not in df.columns:
            df[sub_name] = None
        stu_data[sub_name] = sub_marks
        all_marks.append(sub_marks)
    if all_marks:
        stu_data["no_subs"] = len(all_marks)
        stu_data["marks_sum"] = sum(all_marks)
        stu_data["marks_ave"] = sum(all_marks) / len(all_marks)
        stu_data["marks_max"] = max(all_marks)
        stu_data["marks_min"] = min(all_marks)
    for col in df.columns:
        if col not in stu_data:
            stu_data[col] = None
    df.loc[len(df)] = stu_data
    print("\nStudent added successfully!\n")
    return df

###### edit_students#########

def edit_students(df):
    if df.empty:
        print("no data")
        return df
    print("-----edit_students-----")
    all_cols = df.columns
    print(f"all_cols: {all_cols}")
    all_ids = list(df["stu_id"])
    print(f"all_ids: {all_ids}")
    edit_id = int(input("Enter the edit_id:-  "))
    while edit_id not in all_ids:
        print("ID mismatch")
        edit_id = int(input("Enter the edit_id:-  "))
    row_index = df.index[df["stu_id"] == edit_id][0]
    edit_row = df.loc[[row_index]].to_string(index=False)
    print("edit_row:\n",edit_row)

    new_name = input("give new_name or press enter to keep same:- ")
    if new_name.strip() != "":
        df.loc[row_index, "name"] = new_name
    fix_cols = ["stu_id", "name", "no_subs", 
                "marks_sum", "marks_ave",  
                "marks_max", "marks_min" ]
    sub_cols = [col for col in df.columns if col not in fix_cols]
    for sub in sub_cols:
        cur_val = df.loc[row_index, sub]
        while True:
            try: 
                new_val = input(f"new_val for {sub} (old_val:{cur_val}) or press enter to keep same:- ")
                if new_val.strip() == "":
                    break
                new_val = float(new_val)
                if new_val < 0:
                    print("-ve value")
                    continue
                df.loc[row_index, sub] = new_val
                break
            except ValueError:
                print("ValueError")
    # Option to Add New Subject
    add_more = input("\nDo you wnat to add_more subs?(y/n): ") 
    if add_more.lower().strip() == "y":
        new_sub = input("Enter new_sub name:- ")
        while True:
            try:
                new_marks = float(input("Enter new marks:- "))
                if new_marks < 0:
                    print("-ve marks")
                    continue
                break
            except ValueError:
                print("ValueError")
        if new_sub not in df.columns:
            df[new_sub] = None
        df.loc[row_index, new_sub] = new_marks
        # if new_sub  not in sub_cols:
        #     df.loc[row_index, new_sub] = new_marks

    # Option to Remove Subject

    remove_sub = input("\nDo you wnat to remove_sub subs?(y/n): ")
    if remove_sub.lower().strip() == "y":
        print(f"sub_cols: {sub_cols}")
        del_sub = input("enter the del_sub:- ")
        if del_sub in df.columns:
            df.loc[row_index, del_sub] = None
    sub_cols = [col for col in df.columns if col not in fix_cols]
    all_marks = []
    for sub in sub_cols:
        val = df.loc[row_index, sub]
        if pd.notna(val):
            all_marks.append(float(val))  

                
    # for sub in sub_cols:
    #     sub_marks = df.loc[row_index, sub]
    #     if pd.notna(sub_marks):
    #         all_marks.append(sub_marks)
    if all_marks:
        df.loc[row_index, "no_subs"] = len(all_marks)
        df.loc[row_index, "marks_sum"] = sum(all_marks)
        df.loc[row_index, "marks_ave"] = sum(all_marks) / len(all_marks)
        df.loc[row_index, "marks_max"] = max(all_marks)
        df.loc[row_index, "marks_min"] = min(all_marks)
    else:
        df.loc[row_index, "no_subs"] = 0
        df.loc[row_index, "marks_sum"] = 0
        df.loc[row_index, "marks_ave"] = 0
        df.loc[row_index, "marks_max"] = 0
        df.loc[row_index, "marks_min"] = 0
    print("\nUpdated Data:")
    print(df.loc[[row_index]].to_string(index=False))
    return df  

######## delete_students ######

def delete_students(df):
    if df.empty:
        print("No data")
        return df
    while True:
        all_ids = list(df["stu_id"])
        print(f"\nAvailable IDs: {all_ids}")
        del_id = input("Enter the del_id or press Enter to exit: ")
        if del_id.strip() == "":
            break
        try:
            del_id = int(del_id)
        except ValueError:
            print("Invalid input! Please enter a number.")
            continue
        if del_id not in all_ids:
            print("ID not found!")
            continue
        # Get row index safely
        row_index = df.index[df["stu_id"] == del_id][0]
        print("\nDeleting this student:")
        print(df.loc[[row_index]].to_string(index=False))
        df = df.drop(index=row_index)
        print("\nStudent deleted successfully!")
    print("\nUpdated Data:")
    return df

######## show_students ########

def show_students(df):
    if df.empty:
        print("No data")
    else:
        print(df.fillna("-").to_string(index=False))


######## main funct #########
import pandas as pd
def main():
    fixed_columns = [
    "stu_id", "name", "no_subs",
    "marks_sum", "marks_ave",
    "marks_max", "marks_min" ]
    df = pd.DataFrame(columns=fixed_columns)
    while True:
        print("Student Management System")
        print("Enter 1 to add_students")
        print("Enter 2 to show_students")
        print("Enter 3 to edit_students")
        print("Enter 4 to delete_students")
        print("Enter 5 to Exit!")
        try:
            choice = int(input("Enter the choice:- "))
        except ValueError:
            print("ValueError")
            continue
        # choice = int(input("Enter the choice:- "))

        if choice == 1:
            df = add_students(df)
        elif choice == 2:
            show_students(df)
        elif choice == 3:
            df = edit_students(df)
        elif choice == 4:
            df = delete_students(df)

        elif choice == 5:
            break
        else:
            print("Invalid input")

if __name__ == "__main__":
    main()