#9. Develop a simple GUI based on Emart Grocery and incorporate all the database features


emart.py
import sqlite3
from tkinter import *
from tkinter import messagebox

# DB setup
conn = sqlite3.connect("emart.db")
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS product (
    pid INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    stock INTEGER NOT NULL
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS orders (
    oid INTEGER PRIMARY KEY AUTOINCREMENT,
    pname TEXT,
    qty INTEGER,
    total REAL
)
""")

# Trigger: Prevent stock < 0
cursor.execute("""
CREATE TRIGGER IF NOT EXISTS prevent_negative_stock
BEFORE UPDATE ON product
FOR EACH ROW
WHEN NEW.stock < 0
BEGIN
    SELECT RAISE(FAIL, 'Insufficient stock');
END;
""")

# Function: Total price
def calculate_total(price, qty):
    return price * qty

# GUI Setup
root = Tk()
root.title("E-Mart Grocery")
root.geometry("400x400")

# Add Product
def add_product():
    name = name_entry.get()
    price = float(price_entry.get())
    stock = int(stock_entry.get())

    cursor.execute("INSERT INTO product (name, price, stock) VALUES (?, ?, ?)", (name, price, stock))
    conn.commit()
    messagebox.showinfo("Success", "Product added")

# View Products
def view_products():
    top = Toplevel()
    top.title("All Products")

    cursor.execute("SELECT * FROM product")
    rows = cursor.fetchall()

    for idx, row in enumerate(rows):
        Label(top, text=row).grid(row=idx, column=0)

# Place Order
def place_order():
    pid = int(order_id.get())
    qty = int(order_qty.get())

    cursor.execute("SELECT name, price, stock FROM product WHERE pid=?", (pid,))
    row = cursor.fetchone()

    if row and row[2] >= qty:
        total = calculate_total(row[1], qty)
        cursor.execute("UPDATE product SET stock = stock - ? WHERE pid=?", (qty, pid))
        cursor.execute("INSERT INTO orders (pname, qty, total) VALUES (?, ?, ?)", (row[0], qty, total))
        conn.commit()
        messagebox.showinfo("Order", f"Order placed. Total: ₹{total}")
    else:
        messagebox.showerror("Error", "Not enough stock")

# Widgets
Label(root, text="Add Product").pack()
name_entry = Entry(root)
name_entry.pack()
price_entry = Entry(root)
price_entry.pack()
stock_entry = Entry(root)
stock_entry.pack()
Button(root, text="Add Product", command=add_product).pack()

Button(root, text="View Products", command=view_products).pack(pady=10)

Label(root, text="Place Order").pack()
order_id = Entry(root)
order_id.pack()
order_qty = Entry(root)
order_qty.pack()
Button(root, text="Order", command=place_order).pack()

root.mainloop()
