package com.trows.record_trows.serviceImpl;

import com.trows.record_trows.base.AbstractBaseDao;
import com.trows.record_trows.entity.Account;
import com.trows.record_trows.service.AccountService;
import org.springframework.stereotype.Service;

/**
 * Created by Throws_exception on 2016/4/26.
 */
//@Service("AccountService")
public class AccountServiceImpl extends AbstractBaseDao<Account,String> implements AccountService  {
}
