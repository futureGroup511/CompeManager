package com.future.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.base.BaseAction;
import com.future.domain.Admin;
@Controller
@Scope("prototype")
public class AdminController extends BaseAction<Admin>{

}
