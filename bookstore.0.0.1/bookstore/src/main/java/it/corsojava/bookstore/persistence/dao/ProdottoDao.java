package it.corsojava.bookstore.persistence.dao;

import java.util.List;

import it.corsojava.bookstore.beans.Prodotto;
import it.corsojava.bookstore.exceptions.ProdottoDaoException;

public interface ProdottoDao {

	public List<Prodotto> getProdotti() throws ProdottoDaoException;
	public Prodotto getProdottoById(int idProdotto) throws ProdottoDaoException;
	
}
