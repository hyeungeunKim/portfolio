package kr.co.persistence;

public interface Visitor {
	public abstract int visitday_check(String date)throws Exception;
	public abstract void insert_visit()throws Exception;
	public abstract void update_visit(String date)throws Exception;
}
