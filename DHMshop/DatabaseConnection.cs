using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DHMshop
{
    public class DatabaseConnection
    {
        private string connectionSTR = ConfigurationManager.ConnectionStrings["connectionStr"].ConnectionString;

        private static DatabaseConnection instance;

        public static DatabaseConnection Instance 
        {
            get {
                if(instance == null)
                {
                    instance = new DatabaseConnection();
                };
                return DatabaseConnection.instance;
            } 
            private set => instance = value; 
        }

        //Generate a function sum a array

        private DatabaseConnection() {
            
        }

        public DataTable ExecuteQuerySP(string query, object[] parameter = null)
        {
            DataTable data = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                adapter.Fill(data);

                //connection.Close();
            }

            return data;
        }

        public bool ExecuteNonQuerySP(string query, object[] parameter = null)
        {
            int result = 0;

            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }
                result = command.ExecuteNonQuery();

                //connection.Close();
            }

            return result == 0 ? false : true;
        }

        public object ExecuteScalarSP(string query, object[] parameter = null)
        {
            object data = 0;

            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();

                //connection.Close();
            }

            return data;
        }

        public DataTable ExecuteQuery(String query)
        {
            DataTable data = new DataTable();
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionSTR))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(data);
                    connection.Close();
                }
            }
            catch (Exception e)
            {
                
            }
            return data;
        }
        public bool ExecuteNonQuery(String query)
        {
            int result = 0;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionSTR))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(query, connection);
                    result = command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception e)
            {
                
            }
            return result == 0 ? false : true;
        }
        public object ExecuteScalar(String query)
        {
            object data = 0;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionSTR))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(query, connection);
                    data = command.ExecuteScalar();
                    connection.Close();
                }
            }
            catch (Exception e)
            {

            }
            return data;
        }
    }
}