<?php

namespace App\Controller;

use App\Entity\Post;
use App\Entity\User;
use App\Form\PostType;
use App\Form\UserType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class MemberController extends AbstractController
{
    #[Route('/member', name: 'app_member')]
    public function index(UserRepository $repository): Response
    {
        return $this->render('member/index.html.twig', [
            'users' => $repository->findAll('id'),
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
    #[IsGranted('ROLE_USER')]
    public function edit(Request $request, User $user, UserRepository $userRepository): Response
    {
        $currentUser = $this->getUser();

        if ( $currentUser != $user ) {
            throw $this->createNotFoundException();
        }
        
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
