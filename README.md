# Lessoner

**Lesson planning, submission, principal approval, revision tracking, and print-ready documents in one streamlined school workflow.**

Lessoner is a responsive web app for organizing the lesson-planning process between teachers and school principals. It brings structured lesson-plan authoring, review states, school and teacher management, and A4-ready document output into a single interface.

## What it includes

- **Teacher and principal workflows** for preparing, submitting, reviewing, and finalizing lesson plans.
- **Structured lesson-plan forms** for curriculum details, learning objectives, teaching methodology, teaching-learning activities, resources, assessment, homework, and remarks.
- **Review statuses** including Draft, Pending approval, Needs revision, and Finalized.
- **School and teacher management** interfaces.
- **A4 print layout** for lesson-plan documents, including approval and signature areas.
- **Responsive interface** with mobile navigation, desktop layout, light/dark theme support, and motion that respects reduced-motion preferences.
- **Supabase integration** for authentication, school/profile/plan data, database RPCs, and the `manage-teacher` Edge Function.

## Project structure

```text
lessoner/
├── index.html
├── README.md
├── LICENSE
└── .gitignore
```

The application frontend is intentionally delivered as a single HTML file. It loads the Supabase JavaScript client from a CDN and does not require a frontend build step.

## Backend requirements

The HTML file connects to a Supabase project and expects the backend resources used by the application to exist. These include the `schools`, `profiles`, `plans`, and `mails` tables, the required Row Level Security policies, and RPCs such as `setup_school` and `reject_plan`. Teacher management also invokes the `manage-teacher` Edge Function.

The SQL migrations and Edge Function source are not included in this repository. Deploying the frontend does not automatically create or secure these backend resources. Verify the schema, RPCs, authentication configuration, function deployment, and RLS policies in the Supabase project before using real school data.

The frontend contains a Supabase project URL and a publishable client key. Supabase publishable keys are intended for client use, but they are **not a substitute for authorization**: database access must be protected by correct RLS policies and secure backend functions. Never place a Supabase secret or `service_role` key in this frontend.

## Run locally

Because this is a static HTML application, no package installation or build command is required.

1. Clone or download this repository.
2. Open `index.html` in a modern browser, or serve the repository root with any static HTTP server.
3. Sign in through the configured Supabase project after its backend prerequisites are in place.

Some browser APIs and authentication redirects behave more consistently over HTTP(S) than through a local `file://` URL.

## Deploy to Vercel

1. Import this GitHub repository into Vercel.
2. Use the **Other** framework preset (or no framework preset).
3. Leave the build command empty.
4. Set the output directory to the repository root (usually `.`).
5. Deploy, then verify Supabase authentication redirect URLs and allowed site URLs for the deployed domain.
6. Test teacher signup/sign-in, principal setup, lesson-plan submission and review, and printing in the deployed environment.

Once Git integration is connected, pushes to the configured branch can trigger deployments automatically.

## Email delivery

The current HTML has `CFG.mailEndpoint` set to an empty string. External email delivery is therefore not configured by the frontend. To send real email notifications, implement and secure a server-side endpoint or provider integration, then configure the endpoint there. Do not expose provider secrets in the browser.

## Security and release checklist

Before inviting a real school to use Lessoner:

- Confirm RLS policies enforce school boundaries and teacher/principal permissions.
- Confirm the `manage-teacher` Edge Function validates caller permissions and handles credentials securely.
- Keep secret keys exclusively on the server.
- Configure and test Supabase authentication redirect URLs.
- Test signup, login, password reset, plan ownership, approval/revision permissions, and data isolation between schools.
- Configure email delivery separately if inbox notifications are required.
- Use test records before importing real or sensitive school data.

## License

This project is distributed under the MIT License. See [LICENSE](LICENSE).

---

Built for clearer lesson planning and a smoother review process.
