package org.example;

import java.util.Scanner;


public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        User[] users = {
                new User("abylay", "Абылай", "abylay@mail.com"),
                new User("admin", "Админ", "admin@mail.com"),
                new User("test", "Тест", "test@mail.com")
        };

        while (true) {
            System.out.println("\n1. Показать пользователей");
        System.out.println("2. Изменить данные пользователя");
          System.out.println("0. Выход");
            System.out.print("Выберите действие: ");
            String command = scanner.nextLine();

            if (command.equals("0")) {
                break;
            }

       if (command.equals("1")) {
                for (User user : users) {
                    user.showInfo();
                }
  } else if (command.equals("2")) {
                System.out.print("Введите логин пользователя: ");
                String login = scanner.nextLine().trim();
                User foundUser = null;

   for (User user : users) {
             if (user.getLogin().equalsIgnoreCase(login)) {
                        foundUser = user;
                        break;
                    }
                }

  if (foundUser == null) {
               System.out.println("Пользователь не найден.");
                 continue;
                }

                System.out.println("1. Изменить логин");
                System.out.println("2. Изменить имя");
                System.out.println("3. Изменить email");
                System.out.print("Что изменить? ");
                String choice = scanner.nextLine();

                if (choice.equals("1")) {
                    System.out.print("Новый логин: ");
                    String newLogin = scanner.nextLine().trim();
                    boolean taken = false;
                    for (User user : users) {
                        if (user.getLogin().equalsIgnoreCase(newLogin)) {
                            taken = true;
                            break;
                        }
                    }

                    if (newLogin.isEmpty()) {
                        System.out.println("Логин не может быть пустым.");
                    } else if (taken) {
                        System.out.println("Этот логин уже занят.");
                    } else {
                        foundUser.setLogin(newLogin);
                        System.out.println("Логин изменён.");
                    }

                } else if (choice.equals("2")) {
                    System.out.print("Новое имя: ");
                    String newName = scanner.nextLine().trim();

                    if (newName.isEmpty()) {
                        System.out.println("Имя не может быть пустым.");
                    } else {
                        foundUser.setName(newName);
                        System.out.println("Имя изменено.");
                    }

                } else if (choice.equals("3")) {
                    System.out.print("Новый email: ");
                    String newEmail = scanner.nextLine().trim();
                    boolean taken = false;

                    for (User user : users) {
                        if (user.getEmail().equalsIgnoreCase(newEmail)) {
                            taken = true;
                            break;
                        }
                    }

                    if (!newEmail.contains("@")
                            || newEmail.startsWith("@")
                            || newEmail.endsWith("@")) {
                        System.out.println("Неверный email.");
                    } else if (taken) {
                        System.out.println("Этот email уже занят.");
                    } else {
                        foundUser.setEmail(newEmail);
                        System.out.println("Email изменён.");
                    }

                } else {
                    System.out.println("Нет такого действия.");
                }
            } else {
                System.out.println("Нет такого действия.");
            }
        }

        scanner.close();
    }
}

class User {
    private String login;
    private String name;
    private String email;

    User(String login, String name, String email) {
        this.login = login;
        this.name = name;
        this.email = email;
    }

    String getLogin() {
        return login;
    }

    void setLogin(String login) {
        this.login = login;
    }

    String getName() {
        return name;
    }

    void setName(String name) {
        this.name = name;
    }

    String getEmail() {
        return email;
    }

    void setEmail(String email) {
        this.email = email;
    }

    void showInfo() {
        System.out.println("Логин: " + getLogin()
                + ", имя: " + getName()
                + ", email: " + getEmail());
    }
}