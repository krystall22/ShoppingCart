package com.shoppingcart.dao.impl;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoppingcart.dao.AccountDAO;
import com.shoppingcart.entity.Account;
import com.shoppingcart.entity.Product;
import com.shoppingcart.model.AccountInfo;
import com.shoppingcart.model.CartInfo;
import com.shoppingcart.model.PaginationResult;
import com.shoppingcart.model.ProductInfo;
import com.shoppingcart.util.Utils;

@Repository
@Transactional
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	private SessionFactory sessionFactory;

	// newly added
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public Account getAccountByUserName(String userName) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT ACC FROM Account ACC WHERE ACC.username = :USERNAME";
		Query<Account> query = session.createQuery(hql);
		query.setParameter("USERNAME", userName);
		Account account = (Account) query.uniqueResult();
		return account;
	}

	// newly added
	public PaginationResult<AccountInfo> getAllAccountInfos(int page, int maxResult, int maxNavigationPage) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT NEW " + AccountInfo.class.getName()
				+ " (ACC.username, ACC.password, ACC.active, ACC.userRole) FROM Account ACC";
		Query<AccountInfo> query = session.createQuery(hql);
		return new PaginationResult<AccountInfo>(query, page, maxResult, maxNavigationPage);
	}
	

	// newly added
	public void saveAccountInfo(AccountInfo accountInfo) {
		Session session = sessionFactory.getCurrentSession();
		String username = accountInfo.getUsername();
		Account account = null;
		boolean isNew = false;

		if (username != null) {
			account = getAccountByUserName(username);
		}

		if (account == null) {
			isNew = true;
			account = new Account();
		}

		account.setUsername(username);
		String encodedPassword = bCryptPasswordEncoder.encode(accountInfo.getPassword());
		account.setPassword(encodedPassword);
		account.setUserRole(accountInfo.getUserRole());
		account.setActive(accountInfo.isActive());

		if (isNew) {
			session.persist(account);
		}
		session.flush();

	}
	
	//newly added
	public boolean removeAccountByUsername(String username) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String hql = "DELETE FROM Account ACC WHERE ACC.username = :username1";
		Query query = session.createQuery(hql);
		query.setParameter("username1", username);
		query.executeUpdate();
		return true;
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	return false;
	}
}
