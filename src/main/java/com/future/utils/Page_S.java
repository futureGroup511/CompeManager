package com.future.utils;

import java.util.List;

public class Page_S {

	private Integer currentPage; //当前页
	private Integer pageSize;// 显示记录
	private Integer recordCount; //查询总记录数
	private List recordlist;    //查询出来所需要的数据
	
	private Integer endPageIndex; //尾页
	private Integer beginPageIndex; //首页
	private Integer pageCount; //显示的页数
	
	public Page_S(Integer currentPage, Integer pageSize, Integer recordCount, List recordlist) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.recordCount = recordCount;
		this.recordlist = recordlist;
		
		pageCount=(recordCount+pageSize-1)/pageSize;
		//如果总页数小于10
		if(pageCount<10){
			beginPageIndex=1;
			endPageIndex =pageCount;
		}else{
			beginPageIndex=currentPage-4;
			endPageIndex=currentPage+5;
			if(beginPageIndex<1){
				beginPageIndex=1;
				endPageIndex=10;
			}
			if(endPageIndex>pageCount){
				endPageIndex=pageCount;
				beginPageIndex=pageCount-9;
			}
		}
	}

	public Page_S() {
		super();
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(Integer recordCount) {
		this.recordCount = recordCount;
	}

	public List getRecordlist() {
		return recordlist;
	}

	public void setRecordlist(List recordlist) {
		this.recordlist = recordlist;
	}

	public Integer getEndPageIndex() {
		return endPageIndex;
	}

	public void setEndPageIndex(Integer endPageIndex) {
		this.endPageIndex = endPageIndex;
	}

	public Integer getBeginPageIndex() {
		return beginPageIndex;
	}

	public void setBeginPageIndex(Integer beginPageIndex) {
		this.beginPageIndex = beginPageIndex;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
}
