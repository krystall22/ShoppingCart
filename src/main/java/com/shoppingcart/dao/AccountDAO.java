package com.shoppingcart.dao;

import com.shoppingcart.entity.Account;
import com.shoppingcart.model.AccountInfo;
import com.shoppingcart.model.PaginationResult;

public interface AccountDAO {

	public Account getAccountByUserName(String userName);

	// newly added
	public PaginationResult<AccountInfo> getAllAccountInfos(int page, int maxResult, int maxNavigationPage);

	// newly added
	public void saveAccountInfo(AccountInfo accountInfo);

	// newly added
	public boolean removeAccountByUsername(String username);

}
