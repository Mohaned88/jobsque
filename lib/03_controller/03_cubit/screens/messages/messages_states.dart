class MessagesStates{}

class InitialMessagesState extends MessagesStates{}

class MessagesNotEmptyState extends MessagesStates{}
class MessagesEmptyState extends MessagesStates{}

class LoadingMessagesListState extends MessagesStates{}
class GetMessagesListSuccessState extends MessagesStates{}
class GetMessagesListFailState extends MessagesStates{}

class SentMessageSuccessState extends MessagesStates{}
class SentMessageFailState extends MessagesStates{}