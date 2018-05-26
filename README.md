<h1 align="center">
  <img height="90" src="https://www.cyberark.com/wp-content/uploads/2017/07/11Paths_primary_01_positive_Telefonica_endorsement_RGB.png">
</h1>
  <h4 align="center">Eleven Paths CTF</h4>

<h2> Contents </h2>

<h3> 1ST - Login Page </h3>
First of all, login, use a random username.
Don't be as stupid as I was and before getting into SQLi try to view-source.

If you go to body you'll find a script like this one:
<code>
                    function myFunction() {
                        var pass1 = document.getElementById("pass").value;
                        if (pass1 != "lacontrasenadelficheroessunombre") {
                            document.getElementById("pass").style.borderColor = "#E34234";
                        }
                        else {
                            alert("Contraseña correcta!!!\n\n Nivel 1 de 3 superado");
                        }
                    }
                </code>
           
Just with some basic knowledge you get that the password is "lacontrasenadelficheroessunombre", it also gives you a hint for the next phase.

A zip file is downloaded.

<h3> 2ND - The file </h3>

Open the file and extract it, the password is the name of the file.
You will get an image called Lenna.
Use something like exiftool to get the metadata of the image, you'll find something like this:

<code> http://masterucam.pythonanywhere.com/play_music?user=$YourUsername&access_token=$YourToken </code>

Copy and paste it into your browser.

<h3> 3ND - The Music File </h3>

It is obviously showing your user-agent.
"Yo solo dejo pasar al AUTOR (no intérprete) de esta canción" gives you a hint for this one. 
I tried to get some metadata again, but no chance, the data you get won't be usefull at all. You have to get a reverse music search like Shazam and scan the music.
Get the author and spoof your header with that name.
You can use an app like "User-agent Switcher" for chrome, there are thousands out there.

When you get the correct user, f5 and you're good to go :P

Easy but fun ctf to play!
