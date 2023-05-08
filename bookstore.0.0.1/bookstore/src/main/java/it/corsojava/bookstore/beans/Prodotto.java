package it.corsojava.bookstore.beans;

import java.math.BigDecimal;

public class Prodotto {

	private int idProdotto; 
	private String titolo;
	private String 	sottotitolo; 
	private String descrizione; 
	private BigDecimal prezzo; 
	private BigDecimal aliquota;
	private String nomeFile;
	
	public int getIdProdotto() {
		return idProdotto;
	}
	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}
	public String getTitolo() {
		return titolo;
	}
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	public String getSottotitolo() {
		return sottotitolo;
	}
	public void setSottotitolo(String sottotitolo) {
		this.sottotitolo = sottotitolo;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	/**
	 * Restituisce il prezzo gia' comprensivo di imposte
	 * @return
	 */
	public BigDecimal getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(BigDecimal prezzo) {
		this.prezzo = prezzo;
	}
	/**
	 * Indica l'aliquota percentuale di imposta sul prezzo
	 * @return
	 */
	public BigDecimal getAliquota() {
		return aliquota;
	}
	public void setAliquota(BigDecimal aliquota) {
		this.aliquota = aliquota;
	}

	public String getNomeFile() {
		return nomeFile;
	}
	public void setNomeFile(String nomeFile) {
		this.nomeFile = nomeFile;
	}
	
	public String getImageFileName() {
		return "/bookstore/images/prod00"+(getIdProdotto()-8000)+".png";
	}
	
}
