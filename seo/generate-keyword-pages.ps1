$ErrorActionPreference = 'Stop'
$site = 'https://aslamkhanacademy.com'
$root = Split-Path -Parent $PSScriptRoot

# One page per supplied query.  Intent is used to change the content, not merely the H1.
$source = @'
Web Development Course in Varanasi|web-development-course-in-varanasi|web|course
Best Web Development Course in Varanasi|best-web-development-course-in-varanasi|web|best-course
Web Development Training in Varanasi|web-development-training-in-varanasi|web|training
Web Development Institute in Varanasi|web-development-institute-in-varanasi|web|institute
Best Web Development Institute in Varanasi|best-web-development-institute-in-varanasi|web|best-institute
Web Developer Course in Varanasi|web-developer-course-in-varanasi|web|developer-course
Web Developer Training in Varanasi|web-developer-training-in-varanasi|web|developer-training
Website Development Course in Varanasi|website-development-course-in-varanasi|web|website-course
Website Development Training in Varanasi|website-development-training-in-varanasi|web|website-training
Website Development Institute in Varanasi|website-development-institute-in-varanasi|web|website-institute
Professional Web Development Course in Varanasi|professional-web-development-course-in-varanasi|web|professional
Advanced Web Development Course in Varanasi|advanced-web-development-course-in-varanasi|web|advanced
Web Development Classes in Varanasi|web-development-classes-in-varanasi|web|classes
Web Development Coaching in Varanasi|web-development-coaching-in-varanasi|web|coaching
Web Development Course with Placement in Varanasi|web-development-course-with-placement-in-varanasi|web|placement
Web Development Course with Live Project in Varanasi|web-development-course-with-live-project-in-varanasi|web|live-project
Web Development Course for Beginners in Varanasi|web-development-course-for-beginners-in-varanasi|web|beginner
Web Development Course Fees in Varanasi|web-development-course-fees-in-varanasi|web|fees
Web Development Course Near Me|web-development-course-near-me|web|near-course
Web Development Institute Near Me|web-development-institute-near-me|web|near-institute
IT Training Institute in Varanasi|it-training-institute-in-varanasi|it|institute
Best IT Training Institute in Varanasi|best-it-training-institute-in-varanasi|it|best-institute
IT Institute in Varanasi|it-institute-in-varanasi|it|institute
Best IT Institute in Varanasi|best-it-institute-in-varanasi|it|best-institute
Computer Training Institute in Varanasi|computer-training-institute-in-varanasi|it|training-institute
Best Computer Training Institute in Varanasi|best-computer-training-institute-in-varanasi|it|best-institute
Computer Institute in Varanasi|computer-institute-in-varanasi|it|institute
Best Computer Institute in Varanasi|best-computer-institute-in-varanasi|it|best-institute
Software Training Institute in Varanasi|software-training-institute-in-varanasi|it|software
Best Software Training Institute in Varanasi|best-software-training-institute-in-varanasi|it|best-software
Programming Institute in Varanasi|programming-institute-in-varanasi|it|programming
Coding Institute in Varanasi|coding-institute-in-varanasi|it|coding
Best Coding Institute in Varanasi|best-coding-institute-in-varanasi|it|best-coding
Technical Training Institute in Varanasi|technical-training-institute-in-varanasi|it|technical
Professional IT Courses in Varanasi|professional-it-courses-in-varanasi|it|professional
IT Courses in Varanasi|it-courses-in-varanasi|it|courses
Computer Courses in Varanasi|computer-courses-in-varanasi|it|computer-courses
Job Oriented Computer Courses in Varanasi|job-oriented-computer-courses-in-varanasi|it|job-oriented
Job Oriented IT Courses in Varanasi|job-oriented-it-courses-in-varanasi|it|job-oriented
Advanced Computer Courses in Varanasi|advanced-computer-courses-in-varanasi|it|advanced
IT Training Center in Varanasi|it-training-center-in-varanasi|it|training-center
Computer Training Center in Varanasi|computer-training-center-in-varanasi|it|training-center
Best IT Coaching in Varanasi|best-it-coaching-in-varanasi|it|best-coaching
IT Coaching Classes in Varanasi|it-coaching-classes-in-varanasi|it|coaching
Computer Coaching in Varanasi|computer-coaching-in-varanasi|it|coaching
Computer Classes in Varanasi|computer-classes-in-varanasi|it|classes
Data Analyst Course in Varanasi|data-analyst-course-in-varanasi|data|course
Best Data Analyst Course in Varanasi|best-data-analyst-course-in-varanasi|data|best-course
Data Analyst Institute in Varanasi|data-analyst-institute-in-varanasi|data|institute
Best Data Analyst Institute in Varanasi|best-data-analyst-institute-in-varanasi|data|best-institute
Data Analyst Training in Varanasi|data-analyst-training-in-varanasi|data|training
Data Analyst Classes in Varanasi|data-analyst-classes-in-varanasi|data|classes
Data Analyst Coaching in Varanasi|data-analyst-coaching-in-varanasi|data|coaching
Data Analyst Certification Course in Varanasi|data-analyst-certification-course-in-varanasi|data|certification
Data Analyst Training Institute in Varanasi|data-analyst-training-institute-in-varanasi|data|training-institute
Data Analyst Course with Placement in Varanasi|data-analyst-course-with-placement-in-varanasi|data|placement
Data Analyst Course with Live Projects in Varanasi|data-analyst-course-with-live-projects-in-varanasi|data|live-project
Data Analyst Course for Beginners in Varanasi|data-analyst-course-for-beginners-in-varanasi|data|beginner
Data Analyst Course After Graduation in Varanasi|data-analyst-course-after-graduation-in-varanasi|data|after-graduation
Data Analyst Course After 12th in Varanasi|data-analyst-course-after-12th-in-varanasi|data|after-12th
Data Analyst Course Fees in Varanasi|data-analyst-course-fees-in-varanasi|data|fees
Data Analyst Course Near Me|data-analyst-course-near-me|data|near-course
Data Analyst Training Near Me|data-analyst-training-near-me|data|near-training
Data Analyst Institute Near Me|data-analyst-institute-near-me|data|near-institute
Data Analyst Coaching Near Me|data-analyst-coaching-near-me|data|near-coaching
Become Data Analyst in Varanasi|become-data-analyst-in-varanasi|data|become
'@

function Get-IntentCopy([string]$intent, [string]$cluster) {
  $copy = @{
    'best-course' = '“Best” is a comparison, not a promise. Compare the current syllabus, the amount of independent practice, feedback quality, faculty access, schedule, fees and the work learners can actually show.'
    'best-institute' = 'The right institute is the one that can clearly explain how you will learn, practise and be assessed. Visit or speak with admissions, ask to see the current course plan and compare what is included.'
    'training' = 'Training should include demonstration, guided practice and independent work. Ask how learners receive feedback when a concept or task is difficult.'
    'developer-course' = 'A developer path should build programming habits along with page design: reading errors, breaking a problem into steps, version control and explaining decisions.'
    'developer-training' = 'Developer training becomes useful when you write and debug your own code regularly, not when you only follow a recorded solution.'
    'website-course' = 'Website development focuses on responsive, accessible pages that serve a real visitor. It is a strong starting point before moving into larger web applications.'
    'website-training' = 'Look for website training that includes layout, responsive behaviour, forms, browser testing and a completed page you can present.'
    'website-institute' = 'When comparing a website development institute, ask how the syllabus moves from HTML and CSS into JavaScript, real-world workflow and portfolio work.'
    'professional' = 'Professional learning means a reliable workflow: clear naming, organised files, testing, version control, communication and work you can explain—not a label added to a course name.'
    'advanced' = 'Advanced study works best after you are comfortable with the fundamentals. Confirm prerequisites so the course pace matches your present skills.'
    'classes' = 'Classes are most effective when each session leaves time to try the topic yourself, ask questions and review what did not work.'
    'coaching' = 'Coaching can be valuable when it includes individual direction and feedback. Ask how doubts, missed classes and practical work are handled.'
    'placement' = 'Placement support should be described precisely. It may include resume review, portfolio guidance, interview preparation or job-search support; it is not a guarantee of employment.'
    'live-project' = 'A meaningful live project lets you make decisions, write the work yourself and receive review. Ask what your own contribution will be and how the result will be evaluated.'
    'beginner' = 'Beginners benefit from a pace that starts with vocabulary and fundamentals, then repeats practice in small, finishable tasks. No prior technical background should be assumed without being stated.'
    'fees' = 'Fees, instalment options, batch schedules and what is included can change. Request the current written details before admission and compare the total learning support, not only the headline fee.'
    'near-course' = 'A nearby course is convenient, but commute is only one factor. Also compare the course level, practice method, schedule, instructor access and the projects you will complete.'
    'near-institute' = 'When looking for an institute near you, confirm the exact location and batch timing directly. Then compare the teaching process and course fit before deciding.'
    'training-institute' = 'A training institute should make the learning journey visible: the starting level, course modules, practice format, assessment and the next skills learners can pursue.'
    'software' = 'Software training should teach problem-solving and reliable development habits alongside a language or tool. Ask how students practise logic, debugging, databases and project structure.'
    'best-software' = 'To compare software institutes, look beyond “best” claims. Check the current syllabus, practical assignments, teacher access and examples of original learner work.'
    'programming' = 'Programming develops through steady problem-solving. A suitable institute should teach logic, variables, conditions, functions and debugging in a sequence a beginner can follow.'
    'coding' = 'Coding classes should make room for learners to type, test and correct code themselves. That feedback loop builds confidence far better than passive watching.'
    'best-coding' = 'A useful coding institute will be transparent about its curriculum, class size, practice tasks and support. Compare these concrete details when choosing.'
    'technical' = 'Technical training should connect concepts with practical use. Ask which tools are taught, why they are used and what learners will be able to make independently.'
    'courses' = 'IT courses vary widely in depth. Choose a path based on your current ability and the type of work you want to learn, rather than enrolling in every available tool.'
    'computer-courses' = 'Computer courses can build a foundation or prepare you for a specialist path. Clarify whether the syllabus focuses on digital basics, programming, data, design or software work.'
    'job-oriented' = 'A job-oriented course should build demonstrable skills: completed tasks, projects, a clear resume and the ability to discuss your work. No course can honestly guarantee an outcome.'
    'training-center' = 'A training centre should give clear information about batches, teaching format, practice time and how you can ask for help between sessions.'
    'best-coaching' = 'When evaluating coaching, use evidence: teaching approach, practical feedback, course clarity and current student work—not broad ranking claims.'
    'certification' = 'A certificate has more value when it reflects skills and work you can demonstrate. Confirm the assessment process and the certificate details before joining.'
    'after-graduation' = 'After graduation, choose a course that builds a focused portfolio and a realistic next step. Your existing subject knowledge can often inform the datasets or projects you choose.'
    'after-12th' = 'After 12th, begin with fundamentals and a manageable learning schedule. A well-sequenced foundation gives you more options than rushing into advanced tools.'
    'near-training' = 'For training near you, verify the location, batch availability and teaching format. Practical fit matters as much as distance.'
    'near-coaching' = 'Nearby coaching is useful only if it also gives you the support and level you need. Ask about doubt solving, practical work and feedback before enrolling.'
    'become' = 'Becoming an analyst is a gradual process: learn the tools, practise asking good questions, build projects and learn to communicate what your findings mean.'
  }
  if ($copy.ContainsKey($intent)) { return $copy[$intent] }
  return 'Ask for the current syllabus, class format, practice work, schedule and fees so you can decide whether the learning path fits your goals.'
}

function Get-ClusterCopy([string]$cluster) {
  if ($cluster -eq 'web') { return @{ icon='bi-code-square'; label='Web development'; skills='HTML, CSS, responsive design, JavaScript, browser tools, Git and project workflow'; method='A practical web path starts with page structure and styling, moves to interactive behaviour, and then introduces the workflow used to create and improve a web project.'; outcome='A thoughtful portfolio might include a responsive information site, a form-based page and an interactive interface. Each should show your own code and a short explanation of the problem it solves.'; related='website development, frontend development and full-stack learning' } }
  if ($cluster -eq 'data') { return @{ icon='bi-bar-chart'; label='Data analytics'; skills='spreadsheets, data cleaning, SQL, visualisation, dashboards and communicating findings'; method='A practical data path begins with asking a clear question, inspecting and cleaning information, choosing a suitable calculation, and communicating a useful conclusion.'; outcome='A credible portfolio can show a spreadsheet analysis, a SQL query task and a dashboard with a concise explanation of the findings and limits.'; related='spreadsheets, SQL, dashboards and data storytelling' } }
  return @{ icon='bi-laptop'; label='IT and computer skills'; skills='computer fundamentals, programming logic, web development, data analytics, software workflow and project practice'; method='A useful IT path connects concepts with repeated hands-on work. It helps you choose one direction, build the fundamentals and create evidence of progress.'; outcome='A meaningful portfolio depends on the path you select: it may include a website, a small program, an analysis or a documented technical task.'; related='programming, web development, software and data analytics' }
}

$items = foreach ($line in ($source.Trim() -split "`r?`n")) { $v = $line.Split('|'); [pscustomobject]@{ Keyword=$v[0]; Slug=$v[1]; Cluster=$v[2]; Intent=$v[3] } }
$utf8 = [System.Text.UTF8Encoding]::new($false)
foreach ($item in $items) {
  $detail = Get-IntentCopy $item.Intent $item.Cluster
  $c = Get-ClusterCopy $item.Cluster
  $url = "$site/seo/$($item.Slug).html"
  $title = "$($item.Keyword) | Aslam Khan Academy"
  $description = "Explore $($item.Keyword) at Aslam Khan Academy. Understand the learning path, practical skills, admission questions and current course details."
  $faqItems = @(
    [pscustomobject]@{ q="Who can join $($item.Keyword)?"; a='The right starting level depends on the current syllabus. Beginners should confirm prerequisites and start with fundamentals where needed.' },
    [pscustomobject]@{ q="What skills are covered?"; a="Ask for the current module plan. This learning path can include $($c.skills)." },
    [pscustomobject]@{ q="How is practical work included?"; a='Look for exercises, assignments, project work and feedback that require you to complete tasks independently.' },
    [pscustomobject]@{ q="How should I compare this option?"; a='Compare the current curriculum, course pace, instructor access, practice method, project expectations, schedule and fees.' },
    [pscustomobject]@{ q="Are course fees and batches fixed?"; a='Fees, schedules and batch availability can change. Confirm current details directly with the academy before admission.' },
    [pscustomobject]@{ q="What is the next step after this course?"; a="A suitable next step depends on your progress and interests. The academy can help you discuss related paths in $($c.related)." }
  )
  $faqMarkup = (($faqItems | ForEach-Object { '<div class="col-md-6 col-lg-4"><article class="premium-card card-pad h-100"><h3 class="h5">' + $_.q + '</h3><p class="mb-0">' + $_.a + '</p></article></div>' }) -join '')
  $schema = @{ '@context'='https://schema.org'; '@graph'=@(
    @{ '@type'='Course'; name=$item.Keyword; description="Practical $($c.label) learning path at Aslam Khan Academy."; provider=@{ '@type'='EducationalOrganization'; name='Aslam Khan Academy'; url="$site/" }; url=$url },
    @{ '@type'='BreadcrumbList'; itemListElement=@(@{ '@type'='ListItem'; position=1; name='Home'; item="$site/" }, @{ '@type'='ListItem'; position=2; name='Varanasi Courses'; item="$site/seo/" }, @{ '@type'='ListItem'; position=3; name=$item.Keyword; item=$url }) },
    @{ '@type'='FAQPage'; mainEntity=@($faqItems | ForEach-Object { @{ '@type'='Question'; name=$_.q; acceptedAnswer=@{ '@type'='Answer'; text=$_.a } } }) }
  )} | ConvertTo-Json -Compress -Depth 8
  $html = @"
<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>$title</title><meta name="description" content="$description"><link rel="canonical" href="$url"><meta property="og:type" content="website"><meta property="og:title" content="$title"><meta property="og:description" content="$description"><link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"><link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" rel="stylesheet"><link rel="stylesheet" href="../assets/css/style.css"><script type="application/ld+json">$schema</script></head>
<body><nav class="navbar navbar-expand-lg navbar-light fixed-top"><div class="container"><a class="navbar-brand" href="../index.html" aria-label="Aslam Khan Academy home"><span class="brand-wrap"><span class="brand-mark">AKA</span><span><span class="brand-title d-block">Aslam Khan Academy</span><span class="brand-sub">Skills • Projects • Career</span></span></span></a><a class="btn btn-primary btn-sm ms-auto" href="../contact.html">Ask about this course</a></div></nav><main>
<section class="page-hero"><div class="container"><div class="breadcrumb-wrap"><a href="../index.html">Home</a><i class="bi bi-chevron-right"></i><a href="index.html">Varanasi Courses</a><i class="bi bi-chevron-right"></i><span>$($item.Keyword)</span></div><span class="kicker"><i class="bi $($c.icon)"></i> $($c.label) in Varanasi</span><h1 class="display-title">$($item.Keyword)</h1><p class="lead-copy">Make an informed choice about $($c.label.ToLower()). Explore the skills, practical process and questions that help you select a course suited to your present level and direction.</p><div class="hero-actions"><a href="https://wa.me/916306596098?text=Hello%20Aslam%20Khan%20Academy%2C%20I%20want%20details%20about%20$([uri]::EscapeDataString($item.Keyword))." target="_blank" rel="noopener" class="btn btn-whatsapp"><i class="bi bi-whatsapp me-1"></i> Request current details</a><a href="#guide" class="btn btn-outline-primary">Read the course guide</a></div></div></section>
<section id="guide" class="section"><div class="container"><div class="row g-5"><div class="col-lg-7"><h2 class="section-title">About $($item.Keyword)</h2><p class="section-lead-v2">$($c.method)</p><p>$detail</p><p>The most valuable learning is active. Rather than only completing a list of topics, plan time to try exercises, make errors, ask questions and revisit the parts that need more attention. This gives you a base that remains useful after the course ends.</p></div><div class="col-lg-5"><aside class="premium-card card-pad h-100"><div class="icon-box"><i class="bi $($c.icon)"></i></div><h2 class="h3">Skills to discuss with admissions</h2><p>$($c.skills).</p><p class="mb-0">Ask which skills are included in the current batch and what level of prior knowledge is expected.</p></aside></div></div></div></section>
<section class="section section-soft"><div class="container"><span class="kicker">Learn by doing</span><h2 class="section-title">A practical way to measure progress</h2><div class="row g-4"><div class="col-md-4"><article class="premium-card card-pad h-100"><h3 class="h5">Understand</h3><p>Learn the purpose of a concept before memorising steps. Clear fundamentals make later tools easier to use.</p></article></div><div class="col-md-4"><article class="premium-card card-pad h-100"><h3 class="h5">Practise</h3><p>Complete small tasks independently, test your work and use feedback to improve the next attempt.</p></article></div><div class="col-md-4"><article class="premium-card card-pad h-100"><h3 class="h5">Explain</h3><p>Document what you made, the choices you took and the result. This turns activity into evidence of skill.</p></article></div></div></div></section>
<section class="section"><div class="container"><div class="row g-5"><div class="col-lg-6"><h2 class="section-title">Projects and career preparation</h2><p class="section-lead-v2">$($c.outcome)</p><p>Career preparation can include organising a portfolio, improving a resume and practising how to talk about your work. Confirm the current support available; it should be understood as guidance, not an employment guarantee.</p></div><div class="col-lg-6"><h2 class="section-title">Questions worth asking before admission</h2><ol><li>What is the current syllabus, duration and batch schedule?</li><li>How much time is reserved for independent practical work?</li><li>How are doubts, feedback and missed classes handled?</li><li>What projects will I create myself and take with me?</li><li>What are the current fees and what is included?</li></ol><a class="btn btn-primary" href="../contact.html">Get course guidance</a></div></div></div></section>
<section class="section section-soft"><div class="container"><h2 class="section-title">$($item.Keyword) FAQs</h2><div class="row g-4">$faqMarkup</div></div></section></main><footer><div class="container"><div class="footer-bottom"><span>© 2026 Aslam Khan Academy. All Rights Reserved.</span><a href="index.html">Explore all Varanasi course guides</a></div></div></footer><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script><script src="../assets/js/main.js"></script></body></html>
"@
  $socialMeta = '<meta property="og:type" content="website"><meta property="og:url" content="' + $url + '"><meta name="twitter:card" content="summary"><meta name="twitter:title" content="' + $title + '"><meta name="twitter:description" content="' + $description + '">'
  $html = $html.Replace('<meta property="og:type" content="website">', $socialMeta)
  $toc = '<nav class="container pt-4" aria-label="On this page"><div class="premium-card card-pad"><strong class="d-block mb-2">On this page</strong><div class="d-flex flex-wrap gap-3"><a href="#guide">Overview</a><a href="#learning-method">Learning method</a><a href="#projects">Projects and preparation</a><a href="#faqs">FAQs</a></div></div></nav>'
  $html = $html.Replace('<section id="guide"', $toc + '<section id="guide"')
  $html = $html.Replace('<section class="section section-soft"><div class="container"><span class="kicker">Learn by doing</span>', '<section id="learning-method" class="section section-soft"><div class="container"><span class="kicker">Learn by doing</span>')
  $html = $html.Replace('<section class="section"><div class="container"><div class="row g-5"><div class="col-lg-6"><h2 class="section-title">Projects and career preparation</h2>', '<section id="projects" class="section"><div class="container"><div class="row g-5"><div class="col-lg-6"><h2 class="section-title">Projects and career preparation</h2>')
  $html = $html.Replace('<section class="section section-soft"><div class="container"><h2 class="section-title">$($item.Keyword) FAQs</h2>', '<section id="faqs" class="section section-soft"><div class="container"><h2 class="section-title">$($item.Keyword) FAQs</h2>')
  $relatedLinks = switch ($item.Cluster) {
    'web' { '<a href="web-development-course-in-varanasi.html">Web development course guide</a><a href="website-development-course-in-varanasi.html">Website development course guide</a><a href="web-development-course-for-beginners-in-varanasi.html">Web development for beginners</a>' }
    'data' { '<a href="data-analyst-course-in-varanasi.html">Data analyst course guide</a><a href="data-analyst-training-in-varanasi.html">Data analyst training guide</a><a href="data-analyst-course-for-beginners-in-varanasi.html">Data analytics for beginners</a>' }
    default { '<a href="it-training-institute-in-varanasi.html">IT training institute guide</a><a href="it-courses-in-varanasi.html">IT courses guide</a><a href="computer-courses-in-varanasi.html">Computer courses guide</a>' }
  }
  $related = '<section class="section"><div class="container"><div class="premium-card card-pad"><span class="kicker">Related course guides</span><h2 class="h3">Continue exploring this topic</h2><div class="d-flex flex-wrap gap-3">' + $relatedLinks + '</div></div></div></section>'
  $html = $html.Replace('</main><footer>', $related + '</main><footer>')
  [System.IO.File]::WriteAllText((Join-Path $PSScriptRoot "$($item.Slug).html"), $html, $utf8)
}

$core = @('', 'about.html', 'courses.html', 'training.html', 'why-us.html', 'career-support.html', 'reviews.html', 'faq.html', 'contact.html', 'enroll.html', 'seo/')
$urls = @($core | ForEach-Object { if ($_ -eq '') { "$site/" } else { "$site/$_" } }) + @($items | ForEach-Object { "$site/seo/$($_.Slug).html" })
$xml = "<?xml version=`"1.0`" encoding=`"UTF-8`"?>`n<urlset xmlns=`"http://www.sitemaps.org/schemas/sitemap/0.9`">`n" + (($urls | ForEach-Object { "  <url><loc>$_</loc></url>" }) -join "`n") + "`n</urlset>`n"
[System.IO.File]::WriteAllText((Join-Path $root 'sitemap.xml'), $xml, $utf8)
$contentMap = @($items | ForEach-Object {
  [ordered]@{
    url = "/seo/$($_.Slug).html"
    primary_keyword = $_.Keyword
    topic_cluster = $_.Cluster
    search_intent = $_.Intent
    parent = '/seo/'
    canonical = "$site/seo/$($_.Slug).html"
    index_status = 'index'
  }
})
[System.IO.File]::WriteAllText((Join-Path $PSScriptRoot 'content-map.json'), ($contentMap | ConvertTo-Json -Depth 4), $utf8)
Write-Output "Generated $($items.Count) keyword pages and $($urls.Count) sitemap URLs."
