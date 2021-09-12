import mysql.connector as mysql
from dotenv import load_dotenv
import os

load_dotenv()
SQL_HOST = os.getenv("SQL_HOST")
SQL_USER = os.getenv('SQL_USER')
SQL_PASSWORD = os.getenv('SQL_PASSWORD')


class DB:

    def __init__(self):
        db_create = mysql.connect(
            host=SQL_HOST,
            user=SQL_USER,
            passwd=SQL_PASSWORD
        )

        self.db = mysql.connect(

            host=SQL_HOST,
            user=SQL_USER,
            passwd=SQL_PASSWORD,
            database="mas_first_assignment",
            autocommit=True
        )

        self.cursor = self.db.cursor()

    def get_user_login(self, username):
        sql = "SELECT password FROM users WHERE username = %s"
        get_user = (str(username),)
        self.cursor.execute(sql, get_user)
        return self.cursor.fetchall()

    def create_new_user(self, username, password):
        sql = "INSERT INTO users VALUE (%s, %s)"
        new_user = (str(username), str(password))
        self.cursor.execute(sql, new_user)
