<%method maintitle>
Landing-Page
</%method>
<%method extramenu>
<li>
                   <a class="page-scroll" href="#services">was wir machen</a>
               </li>
               <li>
                   <a class="page-scroll" href="#portfolio">portfolio</a>
               </li>
               <li>
                   <a class="page-scroll" href="#contact">kontakt</a>
               </li>
               </%method>

<header>
   <div class="header-content">
       <div class="header-content-inner">
           <h1 id="homeHeading">Wir verschönern Software und mehr...</h1>
           <hr>
           <p>Ihr Studium heißt Software Engineering, nicht Bunte Buttons!
           Wir verschönern Ihre Software und kümmern uns um Ihr Front-End.</p>
           <a href="#services" class="btn btn-primary btn-xl page-scroll">Was wir anbieten</a>
       </div>
   </div>
</header>


<section id="services">
<div class="container">
<div class="row">
<div class="col-lg-12 text-center">
   <h2 class="section-heading">Was wir anbieten</h2>
   <hr class="primary">
</div>
</div>
</div>
<div class="container">
<div class="row">

<& productlist.mi &>

</div>
</div>
</section>

<& portfolio.mi &>

<& contact.mi, email => 'feedback@salzamt.at', phone => '01 / 123 4567' &>
