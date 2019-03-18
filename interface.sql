package Modele;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Agnes
 */
public class ModeleCategorie extends Modele {

    public static void afficheCategories() {
        try {

            /* Création de la connexion*/
            Connection connexion = startConnection();

            /* Création de l'objet gérant les requêtes */
            Statement declaration = connexion.createStatement();

            /* Requete */
            String query = "SELECT id, nom FROM categorie;";

            /* Exécution d'une requête de lecture */
            ResultSet resultat = declaration.executeQuery(query);

            /* Récupération des données */ 
            while (resultat.next()) {
                Object[] row = new Object[]{
                    resultat.getInt("id"), 
                    resultat.getString("nom")
                };
                System.out.println(Arrays.toString(row));

            }

            /* fermeture du resultatSet */
            resultat.close();
            /* fermeture de la connexion */ 
            closeConnection(connexion);

        } catch (SQLException e) {
            System.err.println(
                    "Erreur d'affichage des catégories: " + e.getMessage()
            );
        }
    }

    /**
     * Ajout d'un catégorie
     *
     * @param nom
     */
    public static void ajouterCategorie(String nom) {
        try {
            /* Création de la connexion */
            Connection co = startConnection();

            /* Création de l'objet gérant les requetes */
            Statement declaration = co.createStatement();

            /* Requete */
            String query = "INSERT INTO categorie ( nom ) VALUES ('" + nom + "')";

            /* Execution d'une requete en écriture */
            int executeUpdate = declaration.executeUpdate(query);

            /* Traitement de l'insertion */
            if (executeUpdate == 1) {
                System.out.println("Insertion de la categorie effectuée ! ");
            } else {
                System.out.println("Insertion de la catégorie non effectuée.");
            }

            /* Fermeture de la connexion */
            closeConnection(co);
        } catch (SQLException e) {
            System.err.println("Erreur d'insertion d'une catégorie " + e.getMessage());
        }
    }

    /**
     * Supression d'une categorie en précisant l'id
     *
     * @param id
     */
    public static void supprimerCategorie(int id) {
        try {
            /* Création de la connexion */
            Connection co = startConnection();
            /* Création de l'objet gérant les requetes */
            Statement declaration = co.createStatement();

            /* Requete */
            String query = "DELETE FROM categorie WHERE id = " + id;

            /* Execution d'une requete en écriture */
            int executeUpdate = declaration.executeUpdate(query);

            /* Traitement de l'insertion */
            if (executeUpdate == 1) {
                System.out.println("Suppression de la categorie effectuée ! ");
            } else {
                System.out.println("Suppression de la catégorie non effectuée.");
            }

            /* Fermeture de la connexion */
            closeConnection(co);
        } catch (SQLException e) {
            System.err.println("Erreur de suppression d'une catégorie " + e.getMessage());
        }
    }

}