using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.Google;
using Microsoft.Owin.Security.Facebook;
using Owin;

namespace DreamBird
{
    public partial class Startup {

        // For more information on configuring authentication, please visit http://go.microsoft.com/fwlink/?LinkId=301883
        public void ConfigureAuth(IAppBuilder app)
        
        
        
        {
            PathString path = new PathString("/dreamhome.aspx/");
            // Enable the application to use a cookie to store information for the signed in user
            // and also store information about a user logging in with a third party login provider.
            // This is required if your application allows users to login
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/components/Account/Login")
            });
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            // Uncomment the following lines to enable logging in with third party login providers
            //app.UseMicrosoftAccountAuthentication(
            //    clientId: "",
            //    clientSecret: "");

            //app.UseTwitterAuthentication(
            //   consumerKey: "NI1ai7QDx96ht2m49tKV3IRhg",// "OTyR678ywG2BLshXXXvEeh89c",
            //   consumerSecret: "uPLZ9Wu4uvCckCJAyz2DF3BwdqKmBJuYxxJWn9wvFJ3ru5zv2P");//"W9QGrpa6RuFhNRlumQAT4zL69q4HFVWdeW5vcJ31ECilFODyzS");
            app.UseTwitterAuthentication(new Microsoft.Owin.Security.Twitter.TwitterAuthenticationOptions 
            {
                ConsumerKey = "NI1ai7QDx96ht2m49tKV3IRhg",
                ConsumerSecret = "uPLZ9Wu4uvCckCJAyz2DF3BwdqKmBJuYxxJWn9wvFJ3ru5zv2P",
                BackchannelCertificateValidator = new Microsoft.Owin.Security.CertificateSubjectKeyIdentifierValidator(new[]
    {
        "A5EF0B11CEC04103A34A659048B21CE0572D7D47", // VeriSign Class 3 Secure Server CA - G2
        "0D445C165344C1827E1D20AB25F40163D8BE79A5", // VeriSign Class 3 Secure Server CA - G3
        "7FD365A7C2DDECBBF03009F34339FA02AF333133", // VeriSign Class 3 Public Primary Certification Authority - G5
        "39A55D933676616E73A761DFA16A7E59CDE66FAD", // Symantec Class 3 Secure Server CA - G4
        "‎add53f6680fe66e383cbac3e60922e3b4c412bed", // Symantec Class 3 EV SSL CA - G3
        "4eb6d578499b1ccf5f581ead56be3d9b6744a5e5", // VeriSign Class 3 Primary CA - G5
        "5168FF90AF0207753CCCD9656462A212B859723B", // DigiCert SHA2 High Assurance Server C‎A 
        "B13EC36903F8BF4701D498261A0802EF63642BC3" // DigiCert High Assurance EV Root CA
    })
            });

            //var options = new FacebookAuthenticationOptions();
            //options.AppId = "1748554558765742";
            //options.AppSecret = "81070f22efc72b2d68fbf6aac4305398";
            //options.Scope.Add("Email");
            //options.CallbackPath = path;

            //app.UseFacebookAuthentication(options); 

            app.UseFacebookAuthentication(appId: "1748554558765742",
             appSecret: "81070f22efc72b2d68fbf6aac4305398");

            //var facebookOptions = new Microsoft.Owin.Security.Facebook.FacebookAuthenticationOptions()
            //{
            //    AppId = "1748554558765742",
            //    AppSecret = "81070f22efc72b2d68fbf6aac4305398",
            // //   BackchannelHttpHandler = new FacebookBackChannelHandler(),
            //    UserInformationEndpoint = "https://graph.facebook.com/v2.4/me?fields=id,name,email,first_name,last_name,location"

            //};
            //facebookOptions.Scope.Add("email");
            //app.UseFacebookAuthentication(facebookOptions);


            app.UseGoogleAuthentication(new GoogleOAuth2AuthenticationOptions()
            {

                //Google api is enabled from this email saba.akmal@kics.edu.pk
                ClientId = "955540096116-qeqs2ji0aj6m8ud9eh3k7ckn5j5e7tv7.apps.googleusercontent.com", //"861389623890-rhlbtlu3b68b6j1ai8pokr0gob3iq16o.apps.googleusercontent.com",
                ClientSecret = "ssEuK7-Su5EkG8QlQYBjz_rV",//"jawnPz7tmUj0vhh1xPSSe8uA",
                CallbackPath = path,
            });
        }
    }
}
