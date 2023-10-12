using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DHMshop
{
    public class DataConnect
    {
        private string connectionSTR = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

        private static DataConnect instance;

        public static DataConnect Instance 
        {
            get {
                if(instance == null)
                {
                    instance = new DataConnect();
                };
                return DataConnect.instance;
            } 
            private set => instance = value; 
        }

        //Generate a function sum a array

        private DataConnect() {
            
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

        public int ExecuteNonQuerySP(string query, object[] parameter = null)
        {
            int data = 0;

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
                data = command.ExecuteNonQuery();

                //connection.Close();
            }

            return data;
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
        public int ExecuteNonQuery(String query)
        {
            int record = 0;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionSTR))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(query, connection);
                    record = command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (Exception e)
            {
                
            }
            return record;
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