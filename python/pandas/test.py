import pandas as pd
data = {
        "Id" : [1, 2, 3, 4, 5], 
         "Name" : ["Vishal", "Rahul", "Vishal", "Akshay", "Sapan"],
         "Age" : [29, 23, 35, 23, 34],
         "City": ["Mumbai","Pune","Bangalore","Noida","Delhi"]         
}
df = pd.DataFrame(data, index=None)

# print(df)
that_id = df.loc[df["Id"]==3].to_string(index=False)
# print(that_id)
all_cols = (df.columns.tolist())
# print(all_cols)
###### or
# print(list(df.columns))

# for i in all_cols:
#     print(f"{i}, {type(i)}")

# names = df["Name"]

# names = list(df["Name"])

names = df["Name"].to_string(index=False)
# print(names)

# two_cols = df[["Name", "Age"]].to_string(index=False)
two_cols = df[["Id", "Name"]].to_string(index=False)
# print(two_cols)


# inplace=True means: Modify the original DataFrame directly instead of creating a new one.
df1 = df.set_index("Id")
second_row_data = df1.loc[2]
# print(second_row_data)
# print()
# print(df["Id"].to_string(index=False))
# print(df1.index)
# print("------------------")
# print(list(df1.index))
# print("------------------")
# print(df1)
# print("------------------")
# print(df.to_string(index=False))
# print(df)
all_ids = list(df["Id"])
print(f"these are the id's: {all_ids}")
edit_id = int(input("Enter the edit_id:- "))
while edit_id not in all_ids:
    print(f"edit_id {edit_id} is not present in {all_ids} enter the correctvalue")
    edit_id = int(input("Enter the edit_id:- "))


# print(df["Id"] == 2)
# print(df.index[df["Id"] == edit_id])
# edit_id = 2
row_index = df.index[df["Id"] == edit_id][0]
# row_index = df.index[df["Id"] == edit_id]
print(f"row_index for edit_id {edit_id} is {row_index}")
print("------------------")
# print(type(row_index))
# print(df.index[1])
# print(df.loc[row_index])
# print(df.loc[row_index, "Name"])
all_cols = df.columns
print("all_cols:- ",all_cols)
print("------------------")
# print(df.loc[2, "Name"])
# print(df.loc[2, ["Name", "Age", "City"]])
for col in all_cols:
    if col != "Id":
        cur_val = df.loc[row_index, col]
        # print(f" {cur_val}")
        # print("------------------")
        # print(f"{col} ({cur_val}) ")
        new_val = input(f"for column {col} enter the new value enter to keep the same {cur_val}:-  ")
        if new_val.strip() != "":
            if col == "Age":
                new_val = int(new_val)
            df.loc[row_index,col] = new_val
print("\nUpdated Details:")
print(df.loc[row_index])

print(df.to_string(index=False))
       

