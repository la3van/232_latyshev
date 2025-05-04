[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/G7DuGOS_)
# Workshop Assignment

This guide will walk you through each task and provide a checklist of requirements to ensure your solution works correctly.

---

## **Quickstart Guide for Students**

### **General Setup:**

Before starting, make sure you have the following:

1. **Development Environment**:
   - Install a C/C++ compiler (e.g., `gcc` for Linux/MacOS, or MinGW for Windows).
   - Use any basic text editor or IDE (e.g., Visual Studio Code, Sublime Text) to edit the source code.

2. **Test Files**:
   - For each task, the test cases will be provided in the form of input/output pairs.
   - You'll need to implement the functions as described, then test your implementation against these cases.
3. **To compile your program, use the following command**:

    ```bash
    gcc -o task task.c

---

## **Tasks:**

### **1. Swap Function**

- Example Input/Output:

  ```text
  Input: 10 20
  Output: 20 10

### **2. Reverse Array**

- Example Input/Output:

  ```text
    Input: 5 1 2 3 4 5
    Output: 5 4 3 2 1

### **3. Transpose Matrix**

- Example Input/Output:

  ```text
    Input: 
    2 3
    1 2 3
    4 5 6
    Output:
    1 4
    2 5
    3 6

### **4. Reverse List**

- Example Input/Output:

  ```text
    Input: 1 2 3 0
    Output: 3 2 1


## **Checklist for Submitting Your Code**

Please make sure your code meets the following requirements:

---

### 1. Code Structure

- Your code should follow proper C coding standards.
- Use functions for each task to modularize your code.
- Provide meaningful variable and function names.

---

### 2. Code Comments

- Add comments to explain your logic where necessary, especially in functions.
- Use comments to briefly describe the purpose of each function and any important variables.

---

### 3. Memory Management

- If using dynamic memory (e.g., in the reverse linked list task), ensure you properly allocate and free memory.

---

### 4. Edge Case Handling

- **Swap Function**: Test for positive, negative, and zero integers.
- **Reverse Array**: Handle arrays with 1 element and empty arrays.
- **Transpose Matrix**: Handle matrices of varying sizes, including edge cases (e.g., 1x1, empty matrix).
- **Reverse List**: Handle empty linked lists, lists with 1 element, and lists with multiple elements.

---

### 5. Test Coverage

- Ensure your solution works for all provided test cases.
- **Test Edge Cases**: Include tests for boundary values, such as empty lists or arrays, and matrices with 1 element.
