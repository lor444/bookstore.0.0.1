package it.corsojava.bookstore.persistence.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.corsojava.bookstore.beans.Prodotto;
import it.corsojava.bookstore.exceptions.ProdottoDaoException;
import it.corsojava.bookstore.persistence.DbConfig;
import it.corsojava.bookstore.persistence.dao.ProdottoDao;

public class ProdottoDaoImpl extends BasicDaoImpl implements ProdottoDao{

	public ProdottoDaoImpl(DbConfig connector) {
		super(connector);
	}

	@Override
	public List<Prodotto> getProdotti() throws ProdottoDaoException {
		try (Connection cn= getConnector().getConnection()) {
			Statement st=cn.createStatement();
			String sql="SELECT * FROM prodotti";
			ResultSet rs = st.executeQuery(sql);
			List<Prodotto> prodotti=new ArrayList<Prodotto>();
			while(rs.next()) {
				Prodotto p =new Prodotto();
				p.setIdProdotto(rs.getInt("idProdotto"));
				p.setTitolo(rs.getString("titolo"));
				p.setSottotitolo(rs.getString("sottotitolo"));
				p.setDescrizione(rs.getString("descrizione"));
				p.setPrezzo(rs.getBigDecimal("prezzo"));
				p.setAliquota(rs.getBigDecimal("aliquota"));
				p.setNomeFile(rs.getString("nomeFile"));
				prodotti.add(p);
			}
			return prodotti;
		}catch(SQLException sqle) {
			throw new ProdottoDaoException("Si e' verificato un problema nel recuperare i prodotti dal database",sqle);
		}
	}

	@Override
	public Prodotto getProdottoById(int idProdotto) throws ProdottoDaoException{
		try (Connection cn= getConnector().getConnection()) {
			String sql="SELECT * FROM prodotti WHERE idProdotto=?";
			PreparedStatement st=cn.prepareStatement(sql);
			st.setInt(1, idProdotto);
			ResultSet rs = st.executeQuery(sql);
			
			if(rs.next()) {
				Prodotto p =new Prodotto();
				p.setIdProdotto(rs.getInt("idProdotto"));
				p.setTitolo(rs.getString("titolo"));
				p.setSottotitolo(rs.getString("sottotitolo"));
				p.setDescrizione(rs.getString("descrizione"));
				p.setPrezzo(rs.getBigDecimal("prezzo"));
				p.setAliquota(rs.getBigDecimal("aliquota"));
				return p;
			}else {
				return null;
			}
		}catch(SQLException sqle) {
			throw new ProdottoDaoException("Si e' verificato un problema nel recuperare i prodotti dal database",sqle);
		}
	}

}
