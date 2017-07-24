package com.acc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="idea")
public class Innovation {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id")
	Integer ideaId;
	@Column(name = "idea_owner")
	String enterpriseId;
	@Column(name = "idea_description")
	String ideaDescription;
	@Column(name = "category")
	String category;
	@Column(name = "sub_category")
	String subCategory;
	public Integer getIdeaId() {
		return ideaId;
	}
	public void setIdeaId(Integer ideaId) {
		this.ideaId = ideaId;
	}
	public String getEnterpriseId() {
		return enterpriseId;
	}
	public void setEnterpriseId(String enterpriseId) {
		this.enterpriseId = enterpriseId;
	}
	public String getIdeaDescription() {
		return ideaDescription;
	}
	public void setIdeaDescription(String ideaDescription) {
		this.ideaDescription = ideaDescription;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	
	
	
	

}
