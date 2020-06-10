<div id="wrapper">
    <div class="user-icon"></div>
    <div class="pass-icon"></div>
    <form name="login-form" class="login-form" action="checklogin.php" method="post">

        <div class="header">
            <h1>Login</h1>
            <span>Accedi con i dati inseriti durante la registrazione.</span>
        </div>

        <div class="content">
           <input name="user" type="text" class="input username" placeholder="Username" onfocus="this.value=''" />
            <input name="password" type="password" class="input password" placeholder="Password" onfocus="this.value=''" />
        </div>
        <div class="footer">
            <input type="submit" name="submit" value="Login" class="button" />
        </div>

    </form>

</div>

<div id="wrapper2">
    <form name="login-form" class="login-form" action="reg.php" method="post">

        <div class="header">
            <h1>Registrazione</h1>
            <span>Non possiedi ancora un account? Registrati</span>
        </div>

        <div class="content">
            <span>  Cognome</span>
            <input name="cognome" type="text" class="input username" placeholder="Cognome"  required/>
            <span>  Nome</span>
            <input name="nome" type="text" class="input username" placeholder="Nome" required />
            <span>  Username</span>
            <input name="user" type="text" class="input username" placeholder="Username"  required/>
            <span>  Password</span>
            <input name="password" type="password" class="input password" placeholder="Password" required/>


        </div>
        <div class="footer">
            <input type="submit" name="submit" value="Registrati" class="button" />
        </div>

    </form>

</div>