Simple Python GUI Application with SQLite Integration 
Aim: 
To develop a simple Python application with a Graphical User Interface (GUI) using 
tkinter, which interacts with an SQLite database to perform basic operations such as insert, 
view, delete selected, and delete all records. 
Theory: 
In modern applications, combining user-friendly interfaces with efficient data storage is 
crucial. This project demonstrates the integration of a GUI developed using tkinter (Python’s 
built-in GUI toolkit) and SQLite, a lightweight, file-based relational database. 
 Tkinter provides tools to create windows, buttons, text boxes, and other interface 
components. 
 SQLite offers a self-contained, serverless SQL database engine, ideal for lightweight 
applications. 
The application follows a CRUD-like model (Create, Read, Delete) and demonstrates how 
SQL commands can be executed within Python functions that are triggered by user actions 
(like button clicks). 
Procedure: 
 Import tkinter and sqlite3 libraries. 
 Connect to an SQLite database and create a users table. 
 Design the GUI layout using labels, entries, buttons, and a listbox. 
 Write a function to insert data into the database. 
 Write a function to fetch and display all records in the listbox. 
 Write a function to delete the selected record using its ID. 
 Write a function to delete all records and reset the ID counter. 
 Bind the functions to their respective buttons. 
 Start the GUI event loop using root.mainloop(). 





Program: 
import sqlite3 
import tkinter as tk 
from tkinter import messagebox 
# --- Database setup --- 
conn = sqlite3.connect('example.db') 
cursor = conn.cursor() 
cursor.execute(''' 
    CREATE TABLE IF NOT EXISTS users ( 
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT NOT NULL, 
        email TEXT NOT NULL 
    ) 
''') 
conn.commit() 
 
# --- Functions --- 
def insert_data(): 
    name = name_entry.get() 
    email = email_entry.get() 
    if name and email: 
        cursor.execute('INSERT INTO users (name, email) VALUES 
(?, ?)', (name, email)) 
        conn.commit() 
        messagebox.showinfo("Success", "Data inserted 
successfully!") 
        name_entry.delete(0, tk.END) 
        email_entry.delete(0, tk.END) 
        show_data() 
    else: 
        messagebox.showwarning("Input Error", "Please enter 
both name and email.") 
 
def show_data(): 
    listbox.delete(0, tk.END) 
    cursor.execute('SELECT * FROM users') 
    for row in cursor.fetchall(): 
        listbox.insert(tk.END, f"{row[0]} | {row[1]} | 
{row[2]}") 
 
def delete_selected(): 
    try: 
        selected = listbox.get(listbox.curselection()) 
        record_id = selected.split('|')[0].strip() 
        cursor.execute('DELETE FROM users WHERE id = ?', 
(record_id,)) 
        conn.commit() 
        messagebox.showinfo("Deleted", "Selected record 
deleted.") 
        show_data() 
    except: 
        messagebox.showwarning("Selection Error", "Please 
select a record to delete.") 
 
def delete_all(): 
    confirm = messagebox.askyesno("Confirm", "Are you sure you 
want to delete all records?") 
    if confirm: 
        cursor.execute('DELETE FROM users') 
        cursor.execute("DELETE FROM sqlite_sequence WHERE 
name='users'") 
        conn.commit() 
        show_data() 
        messagebox.showinfo("Deleted", "All records deleted 
and ID counter reset.") 
 
 
# --- GUI setup --- 
root = tk.Tk() 
root.title("Simple GUI with SQL") 
 
tk.Label(root, text="Name").grid(row=0, column=0) 
tk.Label(root, text="Email").grid(row=1, column=0) 
 
name_entry = tk.Entry(root) 
email_entry = tk.Entry(root) 
name_entry.grid(row=0, column=1) 
email_entry.grid(row=1, column=1) 
 
tk.Button(root, text="Insert", 
command=insert_data).grid(row=2, column=0, columnspan=2, 
pady=5) 
 
listbox = tk.Listbox(root, width=50) 
listbox.grid(row=3, column=0, columnspan=2, pady=10) 
 
tk.Button(root, text="Delete Selected", 
command=delete_selected).grid(row=4, column=0, pady=5) 
tk.Button(root, text="Delete All", 
command=delete_all).grid(row=4, column=1, pady=5) 
 
show_data() 
 
root.mainloop() 
 
 
Output: 
Result: 
Thus, the program to implement a simple GUI application and connect it with an SQL 
database was executed successfully, and the output was verified. 
