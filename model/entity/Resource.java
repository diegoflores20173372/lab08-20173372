package model.entity;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Resource {
	
	@PrimaryKey
	@Persistent (valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private String url;
	@Persistent private boolean status;
	@Persistent private Date create;
	
	public Resource(String url, boolean status, Date create) {
		this.url = url;
		this.status = status;
		this.create = create;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Date getCreate() {
		return create;
	}
	public void setCreate(Date create) {
		this.create = create;
	}
	
}
