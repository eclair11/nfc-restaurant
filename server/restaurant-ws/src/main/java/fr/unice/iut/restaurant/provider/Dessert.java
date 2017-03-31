package fr.unice.iut.restaurant.provider;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import fr.unice.iut.restaurant.database.BddConnexion;
/**
 * Created by Ismael 28/02/2017.
 */
public class Dessert {
	
	public   String nomDessert;
	public   String descriptionDessert;
	public   float prixDessert;
	File monimage = new File("chemin");
	// FileOutputStream ostreamImage = new FileOutputStream(monimage);
	
	public Dessert(String nomDessert,String descrptionDessert, float prixDessert){
		this.nomDessert = nomDessert;
		this.prixDessert = prixDessert;
		this.descriptionDessert = descrptionDessert;
	}	
	
	public Dessert(){}
	
	public   ArrayList<Dessert> GetAllDessert() throws SQLException{
        Connection cn = null;
        Statement st = null;
        ArrayList<Dessert> listDesserts = new ArrayList<Dessert>();
        try {
        	System.out.println( "Connexion à la base de données..." );
        	cn = BddConnexion.getConnection();
        	st = (Statement) cn.createStatement();
	
			ResultSet result = cn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	                ResultSet.CONCUR_READ_ONLY).executeQuery("SELECT nom,description,prix FROM nfc_resto.plats,nfc_resto.tarif WHERE idType_Plat ='3' and T_idTarif = idtarif;");
			while (result.next()) {
				Dessert desserts = new Dessert(result.getString("nom"),result.getString("description"),result.getFloat("prix"));
				listDesserts.add(desserts);
				System.out.println(desserts.getNom());
				System.out.println(desserts.getDescription());
				System.out.println(desserts.getPrix());
				System.out.println(listDesserts.get(0).getNom());
			}
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	System.out.println(listDesserts.size());	
	return listDesserts;
	}
	
	
	public   String getNom() {
		return nomDessert;
	}

	public   void setNom(String nomDessert) {
		this.nomDessert = nomDessert;
	}

	public   String getDescription() {
		return descriptionDessert;
	}

	public   void setDescription(String descriptionDessert) {
		this.descriptionDessert = descriptionDessert;
	}

	public   float getPrix() {
		return prixDessert;
	}

	public   void setPrix(float prixDessert) {
		this.prixDessert = prixDessert;
	}

}