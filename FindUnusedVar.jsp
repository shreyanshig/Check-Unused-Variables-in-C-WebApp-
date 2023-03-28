<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The title</title>
    <link rel="stylesheet" href="finalstyle.css">
    <script src="app.js"></script>
</head>
<body>
    <%@ page import="java.util.*"%>
    <%
        String str=request.getParameter("abc");
        String arr[]=str.split(";");
        for(int i=0;i<arr.length;i++)
        {
            int a=arr[i].indexOf('{');
            int b=arr[i].indexOf("}");
            if(a!=-1)
                arr[i]=arr[i].substring(a+1);
            if(b!=-1)
                arr[i]=arr[i].substring(b+1);
            arr[i]=arr[i].trim();
        }
        HashMap<String,Integer> hm=new HashMap<String,Integer>();
        HashMap<String,String> finalhm=new HashMap<String,String>();
        boolean tf=false;
        for(String x:arr)
        {
            tf=false;
            String s="";
            String finals="";
            if(x.length()>=4)
            {
                if(x.charAt(0)=='f'&&x.charAt(1)=='l'&&x.charAt(2)=='o'&&x.charAt(3)=='a'&&x.charAt(4)=='t')
                {
                    if(x.indexOf("=")!=-1)
                    {
                        s=x.substring(5,x.indexOf("="));
                        tf=true;
                    }
                    else
                        s=x.substring(5);
                    finals="float";
                }
            }
            if(x.length()>=3)
            {
                if(x.charAt(0)=='c'&&x.charAt(1)=='h'&&x.charAt(2)=='a'&&x.charAt(3)=='r')
                {
                    if(x.indexOf("=")!=-1)
                    {
                        s=x.substring(4,x.indexOf("="));
                        tf=true;
                    }
                    else
                        s=x.substring(4);
                    finals="char";
                }

            }
            if(x.length()>=2)
            {
                if(x.charAt(0)=='i'&&x.charAt(1)=='n'&&x.charAt(2)=='t')
                {
                    if(x.indexOf("=")!=-1)
                    {
                        s=x.substring(3,x.indexOf("="));
                        tf=true;
                    }
                    else
                        s=x.substring(3);
                    finals="int";
                }
            }
            if(s!="")
            {
                s=s.trim();
                if(tf==true)
                    hm.put(s,1);
                else
                {
                    hm.put(s,0);
                    finalhm.put(s,finals);
                }
            }
        }
        for(String x:arr)
        {
            int a=x.indexOf("=");
            if(a!=-1)
            {
                int b=x.indexOf("(");
                if(b!=-1)
                {
                    String tempstr=x.substring(x.indexOf("(")+1,a);
                    if(hm.containsKey(tempstr))
                        hm.put(tempstr,hm.get(tempstr)+1);
                    if(finalhm.containsKey(tempstr))
                        finalhm.remove(tempstr);
                }
                else
                {
                    if(hm.containsKey(x.substring(0,a)))
                        hm.put(x.substring(0,a),hm.get(x.substring(0,a))+1);
                    if(finalhm.containsKey(x.substring(0,a)))
                        finalhm.remove(x.substring(0,a));
                }
            }
            else if(x.length()>=4)
            {
                if(x.charAt(0)=='s'&&x.charAt(1)=='c'&&x.charAt(2)=='a'&&x.charAt(3)=='n'&&x.charAt(4)=='f')
                {
                    String varname=x.substring(x.indexOf("&")+1,x.lastIndexOf(")"));
                    if(hm.containsKey(varname))
                        hm.put(varname,hm.get(varname)+1);
                    if(finalhm.containsKey(varname))
                        finalhm.remove(varname);
                }
            }
        }
        String finalstr="";
        for(Map.Entry m:finalhm.entrySet())
        {
            finalstr+=(String)m.getKey()+" "+(String)m.getValue()+"<br>"+"<hr>"+"<br>";
        }
    %>
    <form>
        <input type="submit" value="Your Results are Ready" onclick="return show('<%out.print(finalstr);%>')" class="btn"/>
    </form>
    <div class="resultdiv"><div class="heading"></div><div class="finalresultdiv"></div></div>
    </body>
</html>
