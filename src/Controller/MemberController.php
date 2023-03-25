<?php

namespace App\Controller;

use App\Entity\Post;
use App\Entity\User;
use App\Form\PostType;
use App\Form\UserType;
use App\Repository\PostRepository;
use App\Repository\UserRepository;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MemberController extends AbstractController
{
    #[Route('/member', name: 'app_member')]
    public function index(UserRepository $repository): Response
    {
        return $this->render('member/index.html.twig', [
            'users' => $repository->findAll(),
        ]);
    }

    #[Route('/member/{id}', name: 'app_member_profil')]
    public function show(Request $request, UserRepository $userRepository, int $id, EntityManagerInterface $manager): Response
    {
        $post = new Post();

        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){

            $post->setCreatedAt(new \DateTimeImmutable());
            $post->setUser($this->getUser());

            $manager->persist($post);
            $manager->flush();
            
            return new RedirectResponse($this->generateUrl('app_member_profil', ['id' => $id]));
        }

        $user = $userRepository->find($id);

        if (!$user) {
            throw $this->createNotFoundException('Utilisateur inexistant');
        }

        return $this->render('member/profil.html.twig', [
            'user' => $user,
            'form' => $form,
            ]);
    }

    #[Route('/member/{id}/edit', name: 'app_member_edit')]
    public function edit(Request $request, User $user, UserRepository $userRepository): Response
    {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $userRepository->save($user, true);

            return $this->redirectToRoute('app_member', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('member/edit.html.twig', [
            'user' => $user,
            'form' => $form,
        ]);
    }
}
