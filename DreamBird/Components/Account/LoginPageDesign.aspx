<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LoginPageDesign.aspx.vb" Inherits="Components_Account_LoginPageDesign" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Register OR SignIn</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="../../Content/themes/LoginStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
 <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<body>
<div class="window-wrap">

 <header class="header-global-new" aria-label="Main" role="banner" >
  <div class="rwd wrapper-header nav-container">
    <h1 class="logo" itemscope="" itemtype="http://schema.org/Organization">
      <a href="" itemprop="url">
            <img src="../../Content/Images/dreambird-logo.png" alt="DreamBird Home Page" itemprop="logo" width="100" height="100">   
      </a>
    </h1>

      <nav aria-label="Account" class="nav-account-management">
        <div class="account-link-list" >
          <div class="item nav-link-01" >
                <a class="btn btn-login" href="/login?next=%2Fdashboard">Sign in</a>
          </div>
              <div class="item nav-account-02">
                <a class="btn-neutral btn-register" href="/register">Register</a>
              </div>
        </div>
      </nav>
  </div>
</header>
<div class="section-bkg-wrapper">
    <main id="main" aria-label="Content" tabindex="-1">
        <div id="login-and-registration-container" class="login-register-container">
            <section id="login-anchor" class="form-type">
                <div id="login-form" class="form-wrapper ">
                    <form id="login" class="login-form" tabindex="-1">

                        <div class="section-title">
                            <h2>
                                <span class="text">Sign in</span>
                            </h2>
                        </div>

                        <div class="form-field email-email">
                               <label for="login-email">    Email  </label>
                               <input id="login-email" type="email" name="email" class="form-control " aria-describedby="login-email-desc" minlength="3" maxlength="254" aria-required="true" required="" placeholder="username@domain.com" value="">
                                <span class="tip tip-input" id="login-email-desc">The email address you used to register with DreamBird</span>

                        </div>
                        <div class="form-field password-password">
                             <label for="login-password">    Password  </label>
                             <input id="login-password" type="password" name="password" class="form-control" minlength="2" maxlength="75" aria-required="true" required="" value="">
                             <button type="button" class="forgot-password field-link">Forgot password?</button>

                        </div>
                        <div class="form-field checkbox-remember">
                              <input id="login-remember" type="checkbox" name="remember" class="checkbox form-field-chkbox" aria-describedby="login-remember-desc" value="false" >
                             <label for="login-remember">  Remember me  </label>

                        </div>
                        <button type="submit" class="btn btn-block login-register login-btn" >Sign in</button>
                      <div class="form-field login-provider"> 
                           <div class="section-title">
                            <h2>
                                <span class="text">OR Sign in With</span>
                            </h2>
                        </div>
                        <button type="button" class="facebook-mybutton mybutton" data-provider-url="/auth/login/facebook/?auth_entry=login&amp;next=%2Fdashboard" >
                             <div class="facebook-icon-box icon-box fa fa-facebook " aria-hidden="true" style="line-height: 35px;" >   
                             </div>
                             <span aria-hidden="true">Facebook</span>
                            <span class="sr" style="display:none">Sign in with Facebook</span>
                        </button>

                        <button type="button" class="google-mybutton mybutton"  >
                            <div class="google-icon-box icon-box fa fa-google " aria-hidden="true" style="line-height: 35px;" >   
                            </div>
                            <span aria-hidden="true">Google</span>
                            <span class="sr" style="display:none">Sign in with Google</span>
                        </button>

                        <button type="button" class="twitter-mybutton mybutton" >
                            <div class="twitter-icon-box icon-box fa fa-twitter " aria-hidden="true" style="line-height: 35px;" >   
                            </div>
                            <span aria-hidden="true">Twitter</span>
                            <span class="sr" style="display:none">Sign in with Google</span>
                        </button>
                       </div>
                        </form>
                 </div>

            <section id=Not-register class="register-link">
                  <div class="section-title">
                            <h2>
                                <span class="text">New to DreamBird</span>
                            </h2>
                        </div>

                  <button type="submit" class="btn btn-block  login-register register-btn" >Create Account</button>
            </section>

            </section>

        </div>

    </main>

 </div>
            
    
          
</div>


</body>
</html>

