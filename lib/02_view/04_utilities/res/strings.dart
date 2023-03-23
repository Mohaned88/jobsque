class AppStrings {
  //--------------Splash & OnBoarding

  static const String onBoardingSkip = "Skip";
  static const String onBoardingNext = "Next";
  static const String onBoardingGetStarted = "Get Started ";

  static const List<String> onBoardingTexts = [
    "Find a job, and start building your career from now on",
    "Hundreds of jobs are waiting for you to join together",
    "Get the best choice for the job you've always dreamed of",
  ];
  static const List<String> onBoardingPatterns = [
    "start building",
    "join together",
    "choice for the job",
  ];
  static const List<String> onBoardingSubTexts = [
    'Explore over 25,924 available job roles and upgrade your operator now.',
    'Immediately join us and start applying for the job you are interested in.',
    'The better the skills you have, the greater the good job opportunities for you.',
  ];

  //--------------Register Screen

  static const String register = "Register";
  static const String registerTitle = "Create Account";
  static const String registerSubTitle =
      "Please create an account to find your dream job";

  // Text Fields
  static const String username = "Username";
  static const String email = "Email";
  static const String password = "Password";
  static const String passwordRequirementsM =
      "Password must be at least 8 characters";

  // Forwarding Texts
  static const String createAccount = "Create account";
  static const String loginForwardMessage = "Already have an account? ";
  static const String orSignupWithAccount = "Or Sign up With Account";

  //--------------Login

  static const String loginTitle = "Login";
  static const String loginSubTitle = "Please login to find your dream job";

  // Forwarding Texts
  static const String rememberMe = "Remember me";
  static const String forgotPass = "Forgot Password?";
  static const String registerForwardMessage = "Don’t have an account? ";
  static const String orLoginWithAccount = "Or Login With Account";

  //--------------Authentication Buttons

  static const String googleTitle = "Google";
  static const String facebookTitle = "Facebook";

  //--------------Validation messages

  // Name messages
  static const String shortName = "The name is too short";
  static const String emptyName = "The name can not be empty";

  // Password messages
  static const String shortPassword = "Short Password";
  static const String mustEqualPassword = "The two passwords must be equal";

  // Email messages
  static const String emailEmpty = "The email can not be empty ";
  static const String validEmail = "The email you entered is not valid ";

  // Regular Expression
  static const String emailRegExp = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]";
  static const String nameRegExp = "^[a-zA-Z0-9]";
  static const String phoneNumberRegExp = "^[0-9]";

  // Phone messages
  static const String phoneNumberEmpty = "Phone number can not be empty ";
  static const String validPhoneNumber =
      "The Phone number you entered is not valid ";
  static const String shortPhoneNumber = "Short Phone Number";

  //--------------Work type selection

  static const String workTypeQuestion =
      'What type of work are you interested in?';
  static const String workTypeSubTitle =
      'Tell us what you’re interested in so we can customise the app for your needs.';

  static const List<String> workTypeTitles = [
    'UI/UX Designer',
    'Illustrator Designer',
    'Developer',
    'Management',
    'Information Technology',
    'Research and Analytics',
  ];

  //--------------Location selection

  static const String locationQuestion = 'Where are you preferred Location?';
  static const String locationSubTitle =
      'Let us know, where is the work location you \nwant at this time, so we can adjust it.';
  static const String selectTheCountryYouWantForYourJob =
      'Select the country you want for your job';

  static const String workFromOffice = 'Work From Office';
  static const String remoteWork = 'Remote Work';
  static const List<String> locationType = [
    'Work From Office',
    'Remote Work',
  ];

  static const List<String> countryNames = [
    'United States',
    'Malaysia',
    'Singapore',
    'Indonesia',
    'Philippines',
    'Polandia',
    'India',
    'Vietnam',
    'China',
    'Canada',
    'Saudi Arabia',
    'Argentina',
    'Brazil',
  ];

  //--------------SetUp Success

  static const String setUpSuccessTitle = 'Your account has been set up!';
  static const String setUpSuccessSubTitle =
      'We have customized feeds according to your preferences';

  //--------------Reset Password Screen

  static const String resetPasswordTitle = "Reset Password";
  static const String resetPasswordSubTitle =
      "Enter the email address you used when you joined and we’ll send you instructions to reset your password.";
  static const String rpForwardingMessage = "You remember your password ";
  static const String enterYourEmail = "Enter your email...";
  static const String requestPasswordReset = "Request password reset";

  //--------------Check Email Screen

  static const String checkEmailTitle = 'Check your Email';
  static const String checkEmailSubTitle =
      'We have sent a reset password to your email address';
  static const String openEmailApp = 'Open email app';

  //--------------Password Changed Successfully Screen

  static const String passSuccessTitle = 'Password changed successfully!';
  static const String passSuccessSubTitle =
      'Your password has been changed successfully, we will let you know if there are more problems with your account';

  //--------------Create New Password Screen

  static const String createNewPassTitle = 'Create new password';
  static const String createNewPassSubTitle =
      'Set your new password so you can login and access Jobsque';
  static const String createNewPassConfirm = 'Both password must match';
  static const String createNewPassButtonLabel = 'Reset password';

  static const String enterNewPassword = "Enter new password";
  static const String confirmPassword = "Confirm password";

  //--------------Body Main Screen

  static const List<String> bottomBarPageName = [
    'Home',
    'Message',
    'Applied',
    'Saved',
    'Profile',
  ];

  //--------------Apply Job Screens

  static const String applyJobApplyNowButton = 'Apply Now';

  //--------------Apply Job Screens //--------------Main Screen

  static const String jobDetail = 'Job Detail';
  static const String applyJobTitle = 'Senior UI Designer';

  static const String applyJobLocationCompany = 'Twitter';
  static const String applyJobLocationCountry = 'Jakarta';
  static const String applyJobLocationCity = 'Indonesia';

  static const String applyJobType1 = 'Fulltime';
  static const String applyJobType2 = 'Onsite';
  static const String applyJobType3 = 'Senior';

  static const List<String> applyJobTab = [
    'Description',
    'Company',
    'People',
  ];

  //--------------Apply Job Screens //--------------Main Screen //--------------Description tab
  static const String applyJobDescriptionTitle = 'Job Description';
  static const String applyJobDescriptionSubTitle =
      'Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.';

  static const String applyJobRequiredSkillsTitle = 'Skill Required';

  static const List<String> applyJobRequiredSkills = [
    'A strong visual portfolio with clear understanding of UI methodologies',
    'Ability to create hi-fidelity mock-ups in Figma',
    'Ability to create various graphics for the web e.g. illustrations and icons',
    'Able to facilitate workshops and liaise with stakeholders',
    'Proficiency in the Adobe Creative Suite',
    'Confident communicator with an analytical mindset',
    'Design library/Design system experience',
    '4+ years of commercial experience in UI/Visual Design',
  ];

  //--------------Apply Job Screens //--------------Main Screen //--------------Company tab
  static const String applyJobCompanyContactUs = 'Contact Us';
  static const String applyJobCompanyEmail = 'twitter@mail.com';
  static const String applyJobCompanyWebSiteTitle = 'Website';
  static const String applyJobCompanyWebSite = 'https://twitter.com';
  static const String applyJobCompanyAboutCompanyTitle = 'About Company';
  static const String applyJobCompanyAboutCompanySubTitle =
      'Understanding Recruitment is an award-winning technology, software and digital recruitment consultancy with headquarters in St. Albans, Hertfordshire.We also have a US office in Boston, Massachusetts specialising in working closely with highly skilled individuals seeking their next career move within Next Gen Tech, Backend Engineering, and Artificial Intelligence.We recently celebrated our first decade in business and over the years have been recognised with several industry awards including Best Staffing Firm to Work For 2018 at the SIA Awards for the third consecutive year and ‘Business of the Year 2017’ at the SME Hertfordshire Business Awards.Our teams of specialists operate across all areas of Technology and Digital, including Java, JavaScript, Python, .Net, DevOps & SRE, SDET, Artificial Intelligence, Machine Learning, AI, Digital, Quantum Computing, Hardware Acceleration, Digital, Charity, Fintech, and the Public Sector.';

  //--------------Apply Job Screens //--------------Main Screen //--------------People
  static const String applyJobPeopleNumberOfEmployees = 'Employees For';
  static const String applyJobPeopleJobName = 'UI/UX Design';
  static const List<String> applyJobPeopleFilterItems = [
    'UI/UX Designer',
    'Tech Support'
  ];

  //--------------Apply Job Screens //--------------BioData Screen
  static const String bioDataApplyJob = 'Apply Job';

  static const List<String> bioDataStepTitle = [
    'Biodata',
    'Type of work',
    'Upload portfolio',
  ];

  static const String bioDataSubTitle = 'Fill in your bio data correctly';
  static const String bioDataFullName = 'Full Name';
  static const String bioDataPhoneNumber = 'No.Handphone';

  //--------------Apply Job Screens //--------------WorkType Screen

  static const List<String> applyJobWorkTypeJobTitles = [
    'Senior UX Designer',
    'Senior UI Designer',
    'Graphik Designer',
    'Front-End Developer',
  ];
  static const List<String> applyJobWorkTypeRequiredDocuments = [
    'CV.pdf • Portfolio.pdf',
    'CV.pdf • Portfolio.pdf',
    'CV.pdf • Portfolio.pdf',
    'CV.pdf • Portfolio.pdf',
  ];

  //--------------Apply Job Screens //--------------WorkType Screen

  static const String uploadDocsUploadCV = 'Upload CV';
  static const String uploadDocsOtherFiles = 'Other File';

  static const String uploadDocsUCVBoxTitle = 'Upload your CV';
  static const String uploadDocsUOFBoxTitle = 'Upload your other file';

  static const String uploadDocsUBoxSubTitle = 'Max. file size 10 MB';

  static const String uploadDocsAddFileButtonLabel = 'Add file';

  static const String submit = 'Submit';

  //--------------Apply Job Screens //--------------DataSentSuccess Screen

  static const String dataSentSuccessTitle =
      'Your data has been successfully sent';
  static const String dataSentSuccessSubTitle =
      'You will get a message from our team, about the announcement of employee acceptance';
  static const String dataSentSuccessButtonLabel = 'Back to home';

  //--------------Home Screens

  static const String homeScreenTitle = 'Hi, ';
  static const String homeScreenSubTitle =
      'Create a better future for yourself here';
  static const String homeScreenSearch = 'Search....';
  static const String homeScreenSuggestedJob = 'Suggested Job';
  static const String homeScreenViewAll = 'View all';

  static const List<String> suggestedJobsTitle = [
    'Product Designer',
    'Product Designer2',
  ];

  static const List<String> suggestedJobsSubTitle = [
    'Zoom • United States',
    'Slack • United States',
  ];

  static const List<String> suggestedJobsTypes = [
    'Fulltime',
    'Remote',
    'Design',
  ];

  static const List<String> suggestedJobsCompanies = [
    'Zoom',
    'Slack',
  ];

  static const List<String> suggestedJobsCountries = [
    'United States',
    'Egypt',
  ];

  static const String suggestedJobsSalaryPer = '/Month';

  static const String homeScreenRecentJobs = 'Recent Job';

  static const List<String> searchFilterJobTypes = [
    'Full Time',
    'Remote',
    'Contract',
    'Part Time',
    'Onsite',
    'Internship',
  ];
  static const String searchNotFoundTitle = 'Search not found';
  static const String searchNotFoundSubTitle =
      'Try searching with different keywords so we can show you';
  static const String noNotificationsSubTitle =
      'You will receive a notification if there is something on your account';
  static const String noNotificationsTitle = 'No new notifications yet';
  static const String notificationScreenTitle = 'Notification';
  static const String noSavedSubTitle =
      'Press the star icon on the job you want to save.';
  static const String noSavedTitle = 'Nothing has been saved yet';
  static const String savedScreenTitle = 'Saved';
  static const String noMessagesSubTitle =
      'Once your application has reached the interview stage, you will get a message from the recruiter.';
  static const String noMessagesTitle = 'You have not received any messages';
  static const String messagesScreenTitle = 'Messages';

  static const String profileScreenTitle = 'Profile';
  static const String profileApplied = 'Applied';
  static const String profileReviewed = 'Reviewed';
  static const String profileContacted = 'Contacted';
  static const String profileAbout = 'About';
  static const String profileAboutInfo = "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.";
  static const String profileGeneral = 'General';
  static const String profileEdit = 'Edit';
  static const String profileEditProfile = 'Edit Profile';
  static const String profilePortfolio = 'Portfolio';
  static const String profileLanguage = 'Language';
  static const String profileNotification = 'Notification';
  static const String profileLoginAndSecurity = 'Login and security';
  static const String profileOthers = 'Others';
  static const String profileAccessibility = 'Accessibility';
  static const String profileHelpCenter = 'Help Center';
  static const String profileTermsNConditions = 'Terms & Conditions';
  static const String profilePrivacyPolicy = 'Privacy Policy';

  static const String editProfileChangePhoto = 'Change Photo';
  static const String editProfileBio = 'Bio';
  static const String editProfileAddress = 'Address';
  static const String editProfileSave = 'Save';

  static const String portfolioAddPortfolioHere = 'Add portfolio here';

  static const List<String> languages = [
    'English',
    'Indonesia',
    'Arabic',
    'Chinese',
    'Dutch',
    'French',
    'German',
    'Japanese',
    'Korean',
    'Portuguese'
  ];

  static const String notificationJobNotification = 'Job notification';
  static const String notificationSearchAlert = 'Your Job Search Alert';
  static const String notificationApplicationUpdate = 'Job Application Update';
  static const String notificationApplicationReminder =
      'Job Application Reminders';
  static const String notificationInterestedJobs =
      'Jobs You May Be Interested In';
  static const String notificationSeekerUpdates = 'Job Seeker Updates';
  static const String notificationOther = 'Other notification';
  static const String notificationShowProfile = 'Show Profile';
  static const String notificationAllMessage = 'All Message';
  static const String notificationMessageNudges = 'Message Nudges';

  static const String loginNSecurityAccountAccess = 'Account access';
  static const String loginNSecurityEmailAddress = 'Email address';
  static const String loginNSecurityPhoneNumber = 'Phone number';
  static const String loginNSecurityChangePassword = 'Change password';
  static const String loginNSecurity2StepVerification = 'Two-step verification';
  static const String loginNSecurityFaceID = 'Face ID';

  static const String emailAddressMainEmailAddress = 'Main e-mail address';
  static const String phoneNumberMainPhoneNumber = 'Main phone number';
  static const String phoneNumberResetMsg = 'Use the phone number to reset your password';
  static const String twoStepVerificationSecureMsg = 'Secure your account with two-step verification';
  static const String twoStepVerificationGSTR1 = 'Two-step verification provides additional security by asking for a verification code every time you log in on another device.';
  static const String twoStepVerificationGSTR2 = 'Adding a phone number or using an authenticator will help keep your account safe from harm.';
  static const String twoStepVerificationSelectMethodQ = 'Select a verification method';
  static const List<String> twoStepVerificationMethods = [
    'Telephone number (SMS)',
    'Telephone number (Call)',
    'Email',
  ];
  static const String twoStepVerificationSelectMethodN = 'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.';
  static const String twoStepVerificationAddPhoneNo = 'Add phone number';
  static const String twoStepVerificationSendVCodeMsg = 'We will send a verification code to this number';
  static const String twoStepVerificationEnterPassword = 'Enter your password';
  static const String twoStepVerification6DCodeQ = 'Enter the 6 digit code';
  static const String twoStepVerification6DCodeAuthQ = 'Please confirm your account by entering the authorization code sen to *-*-7234';
  static const String twoStepVerificationResendCode = 'Resend code 42s';
  static const String twoStepVerificationSendCode = 'Send Code';
  static const String twoStepVerificationVerify = 'Verify';

  static const String helpCenterQuery = 'What can we help?';
  static const String helpCenterSuggestionTitle = 'Lorem ipsum dolor sit amet';
  static const String helpCenterSuggestionDescription = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.';

  static const String appliedJobScreenTitle = 'Applied Job';
  static const String appliedJobActive = 'Active';
  static const String appliedJobRejected = 'Rejected';
}
