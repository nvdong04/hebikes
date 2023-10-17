using System;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace DHMshop
{
    public static class Utils
    {
        public static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        public static void ShowToastr(Page page, string message, string title, ToastType type = ToastType.Info)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "toastr_message",
                  String.Format("toastr.{0}('{1}', '{2}');", type.ToString().ToLower(), message, title), addScriptTags: true);
        }

        public enum ToastType
        {
            Success,
            Info,
            Warning,
            Error
        }
    }
}
