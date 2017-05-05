package fr.unice.iut.restaurant.provider;

import fr.unice.iut.restaurant.database.BddConnexion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by Utilisateur on 13/04/2017.
 */
public class Commande {
    String U_idUsers, Horodatage, details;
    int T_idTables;

    public Commande(String U_idUsers,String Horodatage, int T_idTables, String details){
        this.U_idUsers = U_idUsers;
        this.Horodatage = Horodatage;
        this.details = details;
        this.T_idTables = T_idTables;
    }

    public String getU_idUsers() {
        return U_idUsers;
    }

    public void setU_idUsers(String u_idUsers) {
        U_idUsers = u_idUsers;
    }

    public String getHorodatage() {
        return Horodatage;
    }

    public void setHorodatage(String horodatage) {
        Horodatage = horodatage;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public int getT_idTables() {
        return T_idTables;
    }

    public void setT_idTables(int t_idTables) {
        T_idTables = t_idTables;
    }

    public static int create(Commande obj) throws SQLException {
        Connection cn = null;
        Statement st = null;
        ResultSet resultSet = null;
        int ret=0;
        try {
            cn = BddConnexion.getConnection();
            // INSERT INTO commande (Horodatage,T_idTables,U_idUsers,details) VALUES ("31-08-1982 10:20:56",2,2,"blabla ma commande");
            String sql = "INSERT INTO commande (Horodatage,T_idTables,U_idUsers,details) VALUES ('"+obj.getHorodatage()+"'," +
                    "'"+obj.getT_idTables()+"','"+obj.getU_idUsers()+"','"+obj.getDetails()+"') returning idCommande;";
            // st = (Statement) cn.createStatement();
            st = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            resultSet = st.executeQuery(sql);

            if (resultSet.first()){
                ret = resultSet.getInt(1);
            }
            //deconnexion avec la db
            //liberer la memoire
            cn.close();
            st.close();
        }catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ret;
    }
    
    public static int GetIdTable(String Guid)throws SQLException{
    	Connection cn = null;
        Statement st = null;
        ResultSet resultSet = null;
    	int idTable=0;
    	try{
    		cn = BddConnexion.getConnection();
    		String sql = "SELECT idTables FROM nfc_resto.tables WHERE guid='"+Guid+";'";
    		resultSet = cn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	                ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
    		while (resultSet.next()) {
				idTable = resultSet.getInt("idTables");
				System.out.println(idTable);
			}
    	}catch (Exception e) {
			// TODO: handle exception
		}
    	return idTable;
    }
    
    public static int GetIdUser(String username)throws SQLException{
    	Connection cn = null;
        Statement st = null;
        ResultSet resultSet = null;
    	int idUser=0;
    	try{
    		cn = BddConnexion.getConnection();
    		String sql = "SELECT idUsers FROM nfc_resto.users WHERE noTel='"+username+";'";
    		resultSet = cn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	                ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
    		while (resultSet.next()) {
    			idUser = resultSet.getInt("idTables");
				System.out.println(idUser);
			}
    	}catch (Exception e) {
			// TODO: handle exception
		}
    	return idUser;
    }
    

}
