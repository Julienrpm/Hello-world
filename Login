<?php
   
    include ('_header.php');
        
    /* DEBUT VERIFICATION DE LA RECEPTION DE FORMULAIRE */
    if (isset($_POST['user']) && isset($_POST['passwd'])){      // cas ou on reçoit un formulaire
        $login = addslashes($_POST['user']);
        $passwd = md5($_POST['passwd']);
        $reqUsr = 'SELECT * FROM clients WHERE email LIKE "' .$login.'"';
        if($usr = $bdd->query($reqUsr)){
            if($u = $usr->fetch()){
                if($u->password == $passwd){
                    $_SESSION['nom'] = $u->nom;
                    $_SESSION['prenom'] = $u->prenom;
                    ?>
                    <script>
                      document.location.href = "index.php";
                    </script>
                    <?php
                }else{
                    echo "erreur dans le mot de passe";
                    ?> <a href='formLogin.php'> retour </a> <?php
                }   
            }else{
                echo "utilisateur inconnu";
                ?> <a href='formLogin.php'> retour </a> <?php
            }
        }else{
            echo "erreur";
            ?> <a href='formLogin.php'> retour </a> <?php
        }    
    }
    /* FIN VERIFICATION DE LA RECEPTION DE FORMULAIRE */
?>
