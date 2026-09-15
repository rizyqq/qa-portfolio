# Login Test Cases

## 1. Successful login

**ID:** LOGIN-001  
**Title:** Login with valid credentials

### Preconditions
- User is registered
- Login page is opened

### Test Data
- Email: valid registered email
- Password: valid password

### Steps
1. Enter a valid email address.
2. Enter a valid password.
3. Click the **Login** button.

### Expected Result
- User is successfully logged in.
- User is redirected to the main page.
- User's account information is displayed.

---

## 2. Login with invalid password

**ID:** LOGIN-002  
**Title:** Login with valid email and invalid password

### Preconditions
- User is registered
- Login page is opened

### Test Data
- Email: valid registered email
- Password: incorrect password

### Steps
1. Enter a valid email address.
2. Enter an incorrect password.
3. Click the **Login** button.

### Expected Result
- User is not logged in.
- An appropriate error message is displayed.
- User remains on the login page.

---

## 3. Login with empty fields

**ID:** LOGIN-003  
**Title:** Login with empty email and password

### Preconditions
- Login page is opened

### Steps
1. Leave the email field empty.
2. Leave the password field empty.
3. Click the **Login** button.

### Expected Result
- User is not logged in.
- Validation messages are displayed for the required fields.

сейчас что то изменил. это и есть изменение 
