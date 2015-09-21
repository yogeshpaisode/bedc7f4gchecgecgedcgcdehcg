<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.nawandarfilmes.Hibernate.*"%>
<table>

    <th>
        Party Name:    
    </th>
    <th>
        Theater Name:
    </th>
    <th>
        Screen Name:
    </th>
    <th>
        Key Name:
    </th>

<%

SessionFactory sessionFactory=HibernateUtil.getSessionFactory();
Session hib_session=sessionFactory.openSession();

Criteria criteria=hib_session.createCriteria(MovieDetail.class);
criteria.add(Restrictions.eq("movId",1));

MovieDetail md=(MovieDetail)criteria.list().get(0);

criteria=hib_session.createCriteria(WorkOrder.class);
criteria.add(Restrictions.eq("movieDetail",md));

for(Object o:criteria.list()){
    WorkOrder wo=(WorkOrder)o;
    out.print("<tr><td>"+wo.getPartyDetail().getPName()+"</td><td>"+wo.getTheaterDetail().getTName()+"</td><td>"+wo.getScreenDetail().getSName()+"</td><td>"+wo.getWoUnlockKey()+"</td></tr>");
}




hib_session.close();

%>

</table>
